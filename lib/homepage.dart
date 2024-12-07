import 'package:flutter/material.dart';
import 'reuseable_part/donor_card.dart';
import 'drawer_pages/side_drawer.dart';
import 'reuseable_part/navTab_imp.dart';
import 'reuseable_part/section_tile.dart';
import 'reuseable_part/post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for posts
    final List<Map<String, String>> posts = [
      {
        'imageUrl': 'https://via.placeholder.com/300',
        'caption': 'this is a test message left for test',
      },
      {
        'imageUrl': 'https://via.placeholder.com/300',
        'caption': 'this also is a test message left for test',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.offline_bolt_outlined),
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No notifications')),
              );
            },
          ),
        ],
      ),
      drawer: const SideDraw(), // Implement your drawer widget here
      body: CustomScrollView(
        slivers: [
          // First Sliver to display static content like section title and DonorsWidget
          const SliverToBoxAdapter(
            child: SectionTitle(title: 'Users Nearby'),
          ),
           SliverToBoxAdapter(
            child: DonorsWidget(),
          ),
          const SliverToBoxAdapter(
            child: SectionTitle(title: 'Posts on Upcoming Events'),
          ),
          
          // Second Sliver for displaying the posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final post = posts[index];
                return Poster(
                  imageUrl: post['imageUrl']!,
                  caption: post['caption']!,
                  onUpVote: () {
                    // Handle upVote action here
                  },
                  onDownVote: () {
                    // Handle downVote action here
                  },
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavTab(currentIndex: 0), // Implement your navigation tab widget here
    );
  }
}
