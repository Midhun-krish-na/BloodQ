import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  /// Current active tab index
  final int currentIndex;

  const NavTab({super.key, required this.currentIndex});

  /// Handles navigation logic based on the selected index
  void _navigateTo(BuildContext context, int index) {
    if (index == currentIndex) return; // Prevent navigation if already on the selected page

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/BloodGroups');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/groups');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }
// icons and other stylings
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => _navigateTo(context, index),
      indicatorColor: const Color.fromARGB(49, 255, 1, 1),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.water_drop_outlined),
          label: 'Blood Groups',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline),
          label: 'Groups',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
