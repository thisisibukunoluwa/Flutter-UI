import 'package:flutter/material.dart';

import 'package:news_app_ui/screens/article_screen.dart';
import 'package:news_app_ui/screens/discover_screen.dart';
import 'package:news_app_ui/screens/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withAlpha(100),
        items: [
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(left: 50),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    icon: Icon(Icons.home)),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DiscoverScreen.routeName);
                  },
                  icon: Icon(Icons.search)),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(right: 50),
                child: IconButton(
                    onPressed: () {
                      print('No profile screen yet');
                    },
                    icon: Icon(Icons.person)),
              ),
              label: 'Profile'),
        ]);
  }
}
