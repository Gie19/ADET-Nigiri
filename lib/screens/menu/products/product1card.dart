import 'package:flutter/material.dart';
import 'package:practiceapp/screens/navbars/botbar.dart';
import 'package:practiceapp/screens/navbars/topbar.dart';
import 'package:practiceapp/utils/favorites_manager.dart';

class ProductOneCard extends StatefulWidget {
  const ProductOneCard({super.key});

  @override
  State<ProductOneCard> createState() => _ProductOneCardState();
}

class _ProductOneCardState extends State<ProductOneCard> {
  int quantity = 1;

  // Product details
  final Map<String, dynamic> product = {
    'image': "assets/images/product1.jpg",
    'name': "Product Name",
    'price': 20.00,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      drawer: TopBar.buildDrawer(context),
      body: Column(
        children: [
          // Top Section: Back Button, Product Name, and Image
          Stack(
            children: [
              Container(
                color: const Color(0xFF090C9B),
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0), // Space for the back button
                    // Product Name
                    const Center(
                      child: Text(
                        "Product Name",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Product Image
                    Center(
                      child: Image.asset(
                        "assets/images/product1.jpg",
                        height: 400.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              // Back Button Positioned at the Top-Left
              Positioned(
                top: 16.0,
                left: 16.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
          // Bottom Section: Price, Description, Quantity, and Add to Cart
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFB4C5E4),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0)),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "\$20.00",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (FavoritesManager.isFavorite(product)) {
                              FavoritesManager.removeFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Removed from favorites!"),
                                ),
                              );
                            } else {
                              FavoritesManager.addFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Added to favorites!"),
                                ),
                              );
                            }
                          });
                        },
                        child: Icon(
                          FavoritesManager.isFavorite(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  // Product Description
                  const Text(
                    "This is a detailed description of the product. It provides more information about the product's features and benefits.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "OpenSans",
                      color: Colors.white,
                    ),
                  ),
                  // Quantity Selector and Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Selector
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            icon: const Icon(Icons.remove, color: Colors.white),
                          ),
                          Text(
                            "$quantity",
                            style: const TextStyle(
                              fontSize: 32.0,
                              fontFamily: "OpenSans",
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                      // Add to Cart Button
                      SizedBox(
                        width: 200.0, // Set the width of the button
                        height: 50.0, // Set the height of the button
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Added to cart!")),
                            );
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Color(0xFF090C9B), // Set icon color
                            size: 24.0, // Adjust icon size if needed
                          ),
                          label: const Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Color(0xFF090C9B), // Set text color
                              fontSize: 18.0, // Increase font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Set button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ), // Optional: Rounded corners
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BotBar(),
    );
  }
}
