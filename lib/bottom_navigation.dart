import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

// Reusable Bottom Navigation Bar Widget
class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  BottomNavigation({required this.currentIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: onItemSelected, // Pass the item selected callback
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: const Color.fromARGB(255, 86, 35, 35),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Notification'),
          activeColor: const Color.fromARGB(255, 86, 35, 35),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.category),
          title: Text('Category'),
          activeColor: const Color.fromARGB(255, 86, 35, 35),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Account'),
          activeColor: const Color.fromARGB(255, 86, 35, 35),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
