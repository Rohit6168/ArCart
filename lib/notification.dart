import 'package:ar_cart/Home.dart';
import 'package:ar_cart/account.dart';
import 'package:ar_cart/category.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class notification extends StatefulWidget {
  const notification({super.key});
  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  int _currentIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => notification()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => category(user: widget,)),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Account(user: widget,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5DFD5),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5DFD5),
        title: Text('Notifications'),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
