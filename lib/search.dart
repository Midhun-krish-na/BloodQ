import 'package:flutter/material.dart';
//import 'reuseable_part/section_tile.dart';
import 'reuseable_part/navTab_imp.dart';



class Search extends StatelessWidget{
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
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
              )
            ],
          ),
          bottomNavigationBar: const NavTab(currentIndex: 2), // Implement your navigation tab widget here
        );
      }
    }
