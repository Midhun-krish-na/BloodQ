import 'package:flutter/material.dart';
import 'package:bloodq/reuseable_part/navTab_imp.dart';

class BloodGroups extends StatelessWidget {
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final List<Map<String, String>> donors = [
    {'name': 'John Doe', 'group': 'A+', 'contact': '123-456-7890'},
    {'name': 'Jane Smith', 'group': 'A-', 'contact': '987-654-3210'},
    {'name': 'Emily Davis', 'group': 'B+', 'contact': '555-666-7777'},
    {'name': 'Chris Evans', 'group': 'O+', 'contact': '111-222-3333'},
  ];

  BloodGroups({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a stateful widget to manage blood group selection
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Groups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No notifications')),
              );
            },
          ),
        ],
      ),
      body: _BloodGroupBody(bloodGroups: bloodGroups, donors: donors),
      bottomNavigationBar: const NavTab(currentIndex: 1), // Implement your navigation tab widget here
    );
  }
}

class _BloodGroupBody extends StatefulWidget {
  final List<String> bloodGroups;
  final List<Map<String, String>> donors;

  const _BloodGroupBody({required this.bloodGroups, required this.donors});

  @override
  _BloodGroupBodyState createState() => _BloodGroupBodyState();
}

class _BloodGroupBodyState extends State<_BloodGroupBody> {
  String selectedGroup = 'A+';

  @override
  Widget build(BuildContext context) {
    // Filter donors by selected group
    final filteredDonors = widget.donors.where((donor) => donor['group'] == selectedGroup).toList();

    return Column(
      children: [
        // Horizontal scrollable chips
        SizedBox(
          height: 60,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.bloodGroups.map((group) {
                final isSelected = group == selectedGroup;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGroup = group;
                      });
                    },
                    child: Chip(
                      label: Text(
                        group,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: isSelected ? Colors.redAccent : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side:const BorderSide(color: Colors.redAccent),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Donor List
        Expanded(
          child: filteredDonors.isEmpty
              ? Center(child: Text('No donors available for $selectedGroup'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: filteredDonors.length,
                  itemBuilder: (context, index) {
                    return DonorCard(
                      name: filteredDonors[index]['name']!,
                      group: filteredDonors[index]['group']!,
                      contact: filteredDonors[index]['contact']!,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class DonorCard extends StatelessWidget {
  final String name;
  final String group;
  final String contact;

  const DonorCard({
    super.key,
    required this.name,
    required this.group,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.redAccent,
              child: Text(
                group,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: $name',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Group: $group'),
                  Text('Contact: $contact'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
