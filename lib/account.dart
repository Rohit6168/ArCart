import 'package:ar_cart/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart'; // Replace with the actual import path
import 'WelcomeScreen.dart'; // Replace with the actual import path
import 'category.dart'; // Replace with the actual import path
import 'notification.dart'; // Replace with the actual import path
import 'bottom_navigation.dart'; // Replace with the actual import path

class Account extends StatefulWidget {
  final dynamic user;

  const Account({super.key, required this.user});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // int _currentIndex = 3;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });

  //   switch (index) {
  //     case 0:
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => Home()),
  //       );
  //       break;
  //     case 1:
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => notification()),
  //       );
  //       break;
  //     case 2:
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => category(user: widget.user)),
  //       );
  //       break;
  //     case 3:
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => Account(user: widget.user)),
  //       );
  //       break;
  //   }
  // }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Logout Successful',
      desc: 'You have been logged out successfully!',
      btnOkColor: Color(0xFF130101),
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF130101),
        // bottomNavigationBar: BottomNavigation(
        //   currentIndex: _currentIndex,
        //   onItemSelected: _onItemTapped,
        // ),
        appBar: AppBar(
          title: Text(
            'Account',
            style: TextStyle(
              color: Color(0xFFF5DFD5),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFFF5DFD5)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }),
          backgroundColor: Color(0xFF130101),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/user.png'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 10), // Adds spacing between CircleAvatar and Text
              const Text(
                'User 1',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF5DFD5),
                ),
              ),
              Text('user1@gmail.com',
                  style: TextStyle(
                    color: Color(0xFFF5DFD5),
                  )),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 45),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(57, 255, 255, 255),
                    iconColor: Colors.white, // Button color
                    minimumSize: Size(250, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between icon and text
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shop_2,
                              color:
                                  Color(0xFFF5DFD5)), // Privacy Settings icon
                          const SizedBox(width: 10),
                          Text(
                            'Orders',
                            style: TextStyle(color: Color(0xFFF5DFD5)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xFFF5DFD5)), // Forward arrow icon
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(57, 255, 255, 255),
                    iconColor: Colors.white, // Button color
                    minimumSize: Size(250, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between icon and text
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone_in_talk,
                              color:
                                  Color(0xFFF5DFD5)), // Privacy Settings icon
                          const SizedBox(width: 10),
                          Text(
                            'Customer Care',
                            style: TextStyle(color: Color(0xFFF5DFD5)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xFFF5DFD5)), // Forward arrow icon
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(57, 255, 255, 255),
                    iconColor: Colors.white, // Button color
                    minimumSize: Size(250, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between icon and text
                    children: [
                      Row(
                        children: [
                          Icon(Icons.history,
                              color:
                                  Color(0xFFF5DFD5)), // Privacy Settings icon
                          const SizedBox(width: 10),
                          Text(
                            'Purchase History',
                            style: TextStyle(color: Color(0xFFF5DFD5)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xFFF5DFD5)), // Forward arrow icon
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(57, 255, 255, 255),
                    iconColor: Colors.white, // Button color
                    minimumSize: Size(250, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between icon and text
                    children: [
                      Row(
                        children: [
                          Icon(Icons.home,
                              color:
                                  Color(0xFFF5DFD5)), // Privacy Settings icon
                          const SizedBox(width: 10),
                          Text(
                            'Address',
                            style: TextStyle(color: Color(0xFFF5DFD5)),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xFFF5DFD5)), // Forward arrow icon
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 45),
                child: ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,

                    minimumSize: Size(250, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                // Forward arrow icon
              ),
            ]),
          ),
        ));
  }
}
