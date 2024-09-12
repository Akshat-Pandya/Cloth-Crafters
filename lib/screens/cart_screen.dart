import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onExplorePressed;

  CartScreen({required this.onExplorePressed});

  @override
  Widget build(BuildContext context) {
    return buildEmptyUI();
  }

  Widget buildEmptyUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Center the column vertically
        children: [
          CircleAvatar(
            backgroundColor: Colors.pink[100],
            radius: 36, // Background color of the circle avatar
            child: Icon(
              Icons.shopping_cart_outlined, // Icon inside the circle avatar
              color: Colors.black,
              size: 38, // Color of the icon
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your cart is empty!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ElevatedButton(
              onPressed: onExplorePressed,
              child: Text(
                "Explore",
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.redAccent), // Set border color to redAccent
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
