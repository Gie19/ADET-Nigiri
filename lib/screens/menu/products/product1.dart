import 'package:flutter/material.dart';
import 'package:practiceapp/screens/menu/products/product1card.dart'; // Import the new page

class ProductOne extends StatefulWidget {
  const ProductOne({super.key});

  @override
  State<ProductOne> createState() => _ProductOneState();
}

class _ProductOneState extends State<ProductOne> {
  bool isFavorite =
      false; // State to track if the product is marked as favorite

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductOneCard()),
        );
      },
      child: Card(
        elevation: 4.0, // Add shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Image
              Image.asset(
                "assets/images/product1.jpg",
                height: 120.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              // Product Label
              const Text(
                "Product Name",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans",
                ),
              ),
              const SizedBox(height: 5),
              // Product Price
              const Text(
                "\$20.00", // Replace with the product price
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "OpenSans",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Favorite Icon Button
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; // Toggle favorite state
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
