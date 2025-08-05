import 'package:ar_cart/ARViewerScreen.dart';
import 'package:ar_cart/Furnitures/furnitures.dart';
import 'package:ar_cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ar_cart/category.dart'; // Import the category page

class Chair extends StatefulWidget {
  final dynamic user; // Add user parameter
  final List<String> cart;

  const Chair({Key? key, required this.user, required this.cart})
      : super(key: key);

  @override
  State<Chair> createState() => _ChairState();
}

class _ChairState extends State<Chair> {
  void _addToCart(BuildContext context) {
    setState(() {
      widget.cart.add('Chair'); // Add item to the cart
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Chair added to your cart.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  PageController _pageViewController = PageController(initialPage: 0);

  // Future<void> _navigateToCategoryPage() async {
  //   final selectedItem = await Navigator.push<String>(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => Cart(
  //               user: widget.user,
  //               cart: [],
  //             )),
  //   );

  //   if (selectedItem != null) {
  //     // Handle adding the selected item to the cart
  //     // You can also save it to a state variable or local storage as needed
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('$selectedItem added to your cart.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(
              context,
            ); // Return updated wishlist to the previous screen
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF130101), Color(0xFF383038)]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF130101),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF130101),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, -1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _addToCart(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chair(
                                user: widget.user,
                                cart: widget.cart,
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF130101), Color(0xFF383038)]),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    controller: _pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 380,
                              width: 320,
                              color: Colors.white12,
                              child: Stack(children: [
                                Image.asset(
                                  'assets/images/furnitures/chair.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1, -1),
                                  child: ToggleIcon(),
                                ),
                              ]),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 380,
                              width: 320,
                              color: Colors.white12,
                              child: Image.asset(
                                'assets/images/furnitures/chair2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 4),
                  child: SmoothPageIndicator(
                    controller: _pageViewController,
                    count: 2, // Number of pages
                    effect: ExpandingDotsEffect(
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      spacing: 16.0,
                      dotColor: Colors.grey, // Inactive dots
                      activeDotColor: const Color.fromARGB(
                          255, 194, 190, 154), // Active dot color
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ARViewerScreen(
                                      modelUrl:
                                          "https://github.com/dhanashree310/3D-models/raw/refs/heads/main/chair_kitchen.glb",
                                    )));
                      },
                      child: Text(
                        'View in AR',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 190,
                    width: 600,
                    color: Colors.white12,
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Kitchen Home Office Plastic Bar Stool',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Color - Peach Orange',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 200, 167, 113)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color:
                                      const Color.fromARGB(255, 201, 198, 120),
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color:
                                      const Color.fromARGB(255, 201, 198, 120),
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color:
                                      const Color.fromARGB(255, 201, 198, 120),
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color:
                                      const Color.fromARGB(255, 201, 198, 120),
                                ),
                                Icon(
                                  Icons.star_half_rounded,
                                  color:
                                      const Color.fromARGB(255, 201, 198, 120),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '₹ 2,998',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 55,
                    width: 600,
                    color: Colors.white12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Product Details',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment:
                                Alignment.centerLeft, // Align text to the left
                            child: Text(
                              'Sales Package:     1',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Model Number:     Bar Stool for Home Office',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Net Quantity:        1 Chair',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Color:                    Peach Orange',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Warranty:              3 Month',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
