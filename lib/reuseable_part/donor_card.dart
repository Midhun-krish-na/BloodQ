import 'package:flutter/material.dart';

class DonorsWidget extends StatelessWidget{
  DonorsWidget({super.key});
  final List<Map<String, String>> donors = [
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'name': 'John Doe',
      'bloodGroup': '--',
      'location': 'New York, USA',
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'name': 'Jane Smith',
      'bloodGroup': '--',
      'location': 'London, UK',
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'name': 'David Lee',
      'bloodGroup': '--',
      'location': 'Sydney, Australia',
    },
    {
      'imageUrl': 'https://via.placeholder.com/150',
      'name': 'Sophia Brown',
      'bloodGroup': '--',
      'location': 'Toronto, Canada',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: donors.map((donor) {
          return Container(
            width: 240,
            height: 240,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            child: DonorCard(
              imageUrl: donor['imageUrl']!,
              name: donor['name']!,
              bloodGroup: donor['bloodGroup']!,
              location: donor['location']!,
              onContact: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Contacting ${donor['name']}...")),
                );
              },
            ),
          );
         }).toList(),
      ),
    );
  }
}

class DonorCard extends StatelessWidget{
    final String imageUrl;
    final String name;
    final String bloodGroup;
    final String location;
    final VoidCallback onContact;

    const DonorCard ({
        super.key,
        required this.imageUrl,
        required this.name,
        required this.bloodGroup,
        required this.location,
        required this.onContact,
    });

    @override
    Widget build(BuildContext context) {
        return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
                ),
            elevation: 4,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    //profile pic
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                            imageUrl,
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                        ),
                    ),
                    const SizedBox(height: 8),
                    //name
                    Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                        ),
                    ),
                    //Blood Group
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(49, 255, 1, 1),
                            borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                            bloodGroup,
                            style: TextStyle(
                                color: Colors.red[900],
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                    //Location
                    Text(
                        location,
                        style:const TextStyle(
                            color: Color.fromARGB(255, 185, 12, 0),
                            fontSize: 14,
                        ),
                    ),
                    const SizedBox(height: 8),
                    //Contact
                    ElevatedButton(
                        onPressed: onContact,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 187, 187),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),                        ),
                        child: const Text('contact',),
                        ),
                    ],
                ),
            ),
        );
    }
}