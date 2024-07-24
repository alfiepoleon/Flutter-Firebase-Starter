import 'package:flutter/material.dart';

import '../page1/page1.page.dart';
import '../profile/profile.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of widgets to call on tab tap.
  final List<Widget> _children = [
    const Page1(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex], // Current active tab's page
        bottomNavigationBar: bottomNav(onTabTapped: onTabTapped, currentIndex: _currentIndex));
  }
}
