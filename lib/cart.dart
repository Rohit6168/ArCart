import 'package:ar_cart/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:ar_cart/category.dart';  // Import the category page

class Cart extends StatefulWidget {
  final List<String> cart;
  final dynamic user;  // Add user parameter

  const Cart({Key? key, required this.cart, required this.user}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late List<String> cart;

  @override
  void initState() {
    super.initState();
    cart = List.from(widget.cart); // Create a local copy of the cart
  }

  void _removeFromCart(int index) {
    setState(() {
      cart.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item removed from cart.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _navigateToCategoryPage() async {
    final selectedItem = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => category(user: widget.user)),
    );

    if (selectedItem != null) {
      setState(() {
        cart.add(selectedItem);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$selectedItem added to your cart.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bag'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, cart); // Return updated cart to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Wishlist(wishlist: []),
                ),
              ); // Replace with your actual wishlist data
            },
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ListTile(
                    title: Text(
                      cart[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeFromCart(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCategoryPage, // Navigate to category page
        child: Icon(Icons.add),
      ),
    );
  }
}
