import 'package:flutter/material.dart';
import 'package:practiceapp/screens/menu/products/product1.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF090C9B),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Menu Text
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    color: Colors.white,
                  ),
                ),
              ),
              // First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ProductOne(), // Product card 1
                  ),
                  Expanded(
                    child: ProductOne(), // Product card 2
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Add spacing between rows
              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ProductOne(), // Product card 3
                  ),
                  Expanded(
                    child: ProductOne(), // Product card 4
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Add spacing between rows
              // Third Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ProductOne(), // Product card 5
                  ),
                  Expanded(
                    child: ProductOne(), // Product card 6
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
