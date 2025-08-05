import 'package:ar_cart/cart.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  final List<String> wishlist;

  const Wishlist({Key? key, required this.wishlist}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late List<String> wishlist;

  @override
  void initState() {
    super.initState();
    wishlist =
        List.from(widget.wishlist); // Create a local copy of the wishlist
  }

  void _removeFromWishlist(int index) {
    setState(() {
      wishlist.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item removed from wishlist.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context,
                wishlist); // Return updated wishlist to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cart(
                            cart: [],
                            user: [],
                          ))); // Return updated wishlist to the previous screen
            },
          ),
        ],
      ),
      body: wishlist.isEmpty
          ? Center(
              child: Text(
                'Your wishlist is empty!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ListTile(
                    title: Text(
                      wishlist[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeFromWishlist(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
