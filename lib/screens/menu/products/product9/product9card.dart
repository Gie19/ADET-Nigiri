import 'package:flutter/material.dart';
import 'package:practiceapp/screens/navbars/botbar.dart';
import 'package:practiceapp/screens/navbars/topbar.dart';
import 'package:practiceapp/utils/favorites_manager.dart';
import 'package:practiceapp/utils/cart_manager.dart';

class ProductNineCard extends StatefulWidget {
  const ProductNineCard({super.key});

  @override
  State<ProductNineCard> createState() => _ProductNineCardState();
}

class _ProductNineCardState extends State<ProductNineCard> {
  int quantity = 1;

  // Product details
  final Map<String, dynamic> product = {
    'image': "assets/images/product9.JPG",
    'image2': "assets/images/product9r.png",
    'name': "Curry Fries",
    'price': 180.00,
    'description': "Potato wedgies dunked in Special Curry saws.",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090C9B),
      appBar: const TopBar(),
      drawer: TopBar().buildDrawer(context),
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
                    const SizedBox(height: 40.0),
                    // Product Name
                    Center(
                      child: Text(
                        product['name'],
                        style: const TextStyle(
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
                      child: SizedBox(
                        child: Image.asset(
                          product['image2'],
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Price
                      Text(
                        "₱ ${product['price'].toStringAsFixed(1)}",
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Favorite Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (FavoritesManager.isFavorite(product)) {
                              FavoritesManager.removeFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: const [
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text("Removed from favorites!"),
                                    ],
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              );
                            } else {
                              FavoritesManager.addFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: const [
                                      Icon(Icons.favorite, color: Colors.white),
                                      SizedBox(width: 10),
                                      Text("Added to favorites!"),
                                    ],
                                  ),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    68,
                                    123,
                                    186,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 38, 132, 180),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FavoritesManager.isFavorite(product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Product Description
                  Text(
                    product['description'],
                    style: const TextStyle(
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
                          // Decrease Quantity Button
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Color(0xFF090C9B),
                                size: 20.0,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Quantity Text
                          Text(
                            "$quantity",
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontFamily: "OpenSans",
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Increase Quantity Button
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xFF090C9B),
                                size: 16.0,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      // Add to Cart Button
                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              // Check if the product is already in the cart
                              if (CartManager.isInCart(product)) {
                                // If it exists, update the quantity and show a message
                                CartManager.addToCart(product, quantity);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: const [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Product already in cart. Quantity updated!",
                                        ),
                                      ],
                                    ),
                                    backgroundColor: Colors.orange,
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                              } else {
                                // If it doesn't exist, add it to the cart and show a message
                                CartManager.addToCart(product, quantity);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: const [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Added to cart!"),
                                      ],
                                    ),
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      68,
                                      123,
                                      186,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(seconds: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Color(0xFF090C9B),
                            size: 24.0,
                          ),
                          label: const Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Color(0xFF090C9B),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
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
