import 'package:flutter/material.dart';
import 'package:practiceapp/screens/navbars/botbar.dart';
import 'package:practiceapp/screens/navbars/topbar.dart';
import 'package:practiceapp/utils/cart_manager.dart';
import 'package:practiceapp/screens/order.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool showOrderForm = false;

  void _handleCheckoutComplete() {
    setState(() {
      CartManager.clearCart();
      showOrderForm = false;
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order placed successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleBackPressed() {
    setState(() {
      showOrderForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.getCartItems();

    // Calculate the total price of all items in the cart
    double totalPrice = cartItems.fold(0, (sum, item) {
      return sum + (item['price'] * item['quantity']);
    });

    return Scaffold(
      appBar: TopBar(),
      drawer: TopBar.buildDrawer(context),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF090C9B),
            child:
                cartItems.isEmpty && !showOrderForm
                    ? const Center(
                      child: Text(
                        "Your cart is empty!",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "OpenSans",
                          color: Colors.white,
                        ),
                      ),
                    )
                    : showOrderForm
                    ? OrderForm(
                      onCheckoutComplete: _handleCheckoutComplete,
                      onBackPressed: _handleBackPressed,
                      totalAmount: totalPrice,
                      products: cartItems, // Pass cart items to OrderForm
                    )
                    : ListView.builder(
                      itemCount:
                          cartItems.length + 1, // Add 1 for the total section
                      itemBuilder: (context, index) {
                        if (index == cartItems.length) {
                          // Total Price Section
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ), // White line
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total:",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // White text
                                  ),
                                ),
                                Text(
                                  "\$${totalPrice.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // White text
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        final cartItem = cartItems[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          leading: Image.asset(
                            cartItem['image'] ?? 'assets/images/default.png',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.cover,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem['name'],
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "Price: \$${cartItem['price']}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (cartItem['quantity'] > 1) {
                                          cartItem['quantity']--;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${cartItem['quantity']}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartItem['quantity']++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        CartManager.removeFromCart(cartItem);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),
          // Forward Button Positioned at the Bottom-Right
          if (cartItems.isNotEmpty &&
              !showOrderForm) // Show only if the cart is not empty and order form is not displayed
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    showOrderForm = true;
                  });
                },
                backgroundColor: Colors.white, // Blue background
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF090C9B), // White color
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BotBar(),
    );
  }
}
