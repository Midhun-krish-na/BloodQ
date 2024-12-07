import 'package:flutter/material.dart';
import 'homepage.dart';
import 'blood_groups.dart';
import 'search.dart';
import 'group.dart';
import 'profile.dart';

void main() => runApp(const BloodQ());

class BloodQ extends StatelessWidget {
  const BloodQ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/BloodGroups': (context) =>  BloodGroups(),
        '/search': (context) => const Search(), // Placeholder
        '/groups': (context) => const Group(), // Placeholder
        '/profile': (context) => const Profile(), // Placeholder
      },
    );
  }
}
