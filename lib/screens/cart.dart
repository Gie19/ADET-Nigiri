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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Order placed successfully!",
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
      drawer: TopBar().buildDrawer(context),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF090C9B),
            child:
                cartItems.isEmpty && !showOrderForm
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 80.0,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            "Your cart is empty!",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OpenSans",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Add items to your cart to see them here.",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "OpenSans",
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                    : showOrderForm
                    ? OrderForm(
                      onCheckoutComplete: _handleCheckoutComplete,
                      onBackPressed: _handleBackPressed,
                      totalAmount: totalPrice,
                      products: cartItems, // Pass cart items to OrderForm
                    )
                    : Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "My Cart",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: "OpenSans",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cartItems.length + 1,
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
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Total:",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "₱ ${totalPrice.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
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
                                  cartItem['image'] ??
                                      'assets/images/default.png',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        cartItem['name'],
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 0.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "₱${cartItem['price']}",
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
                                                  if (cartItem['quantity'] >
                                                      1) {
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
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              CartManager.removeFromCart(
                                                cartItem,
                                              );
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.red, // X Button Red
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
                      ],
                    ),
          ),
          // Next Button Positioned at the Bottom-Right
          if (cartItems.isNotEmpty &&
              !showOrderForm) // Show only if cart has items & order form is hidden
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    showOrderForm = true;
                  });
                },
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF090C9B),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BotBar(),
    );
  }
}
