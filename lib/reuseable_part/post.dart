import 'package:flutter/material.dart';

class Poster extends StatefulWidget{
  final List<Map<String, String>> posts = [
  {
    'imageUrl': 'https://via.placeholder.com/300',
    'caption': 'Donate Blood, Save Lives!',
  },
  {
    'imageUrl': 'https://via.placeholder.com/300',
    'caption': 'Free Health Checkup Camp!',
  },
];

  final String imageUrl;
  final String caption;
  final VoidCallback? onUpVote;
  final VoidCallback? onDownVote;

   Poster({
    super.key,
    required this.imageUrl,
    required this.caption,
    this.onUpVote,
    this.onDownVote,
    });

  @override
  State<Poster> createState() => _PosterState();

}

class _PosterState extends State<Poster>{
  int upVotes = 0;
  int downVotes = 0;

  void _handleUpVote(){
    setState(() {
      upVotes++;
    });
    if (widget.onUpVote != null){
      widget.onUpVote!();
    }
  }

  void _handleDownVote(){
    setState(() {
      downVotes++;
    });
    if (widget.onDownVote != null){
      widget.onDownVote!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image of poster
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              widget.imageUrl,
              height: 200,
              width: double.infinity,
              fit:BoxFit.cover,
              errorBuilder: (context, error, stackTrace){
                return Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.broken_image,
                     size: 50, color: Colors.grey),
                  ),
                );
              },
             ),
          ),

          //caption Sec
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.caption,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //interaction row
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //voting buttons
                Row(
                  children: [
                // UpVote Button
                    IconButton(
                      onPressed: _handleUpVote,
                      icon: const Icon(Icons.thumb_up_alt_outlined),
                      color: Colors.green,
                    ),
                    Text(upVotes.toString(), style: const TextStyle(fontSize: 14)),

                    const SizedBox(width: 16),

                    // DownVote Button
                    IconButton(
                      onPressed: _handleDownVote,
                      icon: const Icon(Icons.thumb_down_alt_outlined),
                      color: Colors.red,
                    ),
                    Text(downVotes.toString(), style: const TextStyle(fontSize: 14)),
                  ],
                ),
                  //Share and Bookmark
                  IconButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar
                        (const SnackBar(content: Text('Sending...')),
                      );
                    }, 
                    icon: const Icon(Icons.share),
                    color: const Color.fromARGB(255, 70, 70, 70),
                  ),
                ],
              ),    
          )
        ],
      )
    );
  }
}

/*body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Poster(
            imageUrl: post['imageUrl']!,
            caption: post['caption']!,
            onUpVote: () {
              print('UpVoted post: ${post['caption']}');
            },
            onDownVote: () {
              print('DownVoted post: ${post['caption']}');
            },
          );
        },
      ),
    );*/