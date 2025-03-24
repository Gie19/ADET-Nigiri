import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderForm extends StatefulWidget {
  final Function() onCheckoutComplete;
  final Function() onBackPressed;
  final double totalAmount;
  final List<Map<String, dynamic>> products;

  const OrderForm({
    super.key,
    required this.onCheckoutComplete,
    required this.onBackPressed,
    required this.totalAmount,
    required this.products,
  });

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dateTimeController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _showDateTimePicker() async {
    if (!mounted) {
      return;
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context, // Required to display the picker
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (!mounted || pickedDate == null) {
      return;
    }
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context, // Required to display the picker
      initialTime: TimeOfDay.now(),
    );

    if (!mounted || pickedTime == null) {
      return;
    }

    setState(() {
      _dateTimeController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year} at ${pickedTime.format(context)}";
    });
  }

  Future<void> _sendOrderToGoogleSheet(
    Map<String, dynamic> orderDetails,
  ) async {
    const String webAppUrl =
        "https://script.google.com/macros/s/AKfycbwog_aBgpG14wlN45JQY15P9fUG6gAR2Hh8yQ_y0QAE10-MPWvaYiZUticZw5dkc3baXw/exec";
    try {
      final response = await http.post(
        Uri.parse(webAppUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(orderDetails),
      );

      if (response.statusCode == 200) {
        debugPrint("Order sent successfully: ${response.body}");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Order sent successfully!")),
          );
        }
      }
    } catch (e) {
      debugPrint("Error sending order: $e");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Error sending order.")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E9F9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: widget.onBackPressed,
        ),
        title: const Text(
          "Order form",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    "Pickup Details",
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Full name",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _dateTimeController,
                  decoration: InputDecoration(
                    hintText: "Date & Time",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                  ),
                  readOnly: true,
                  onTap: _showDateTimePicker,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select date and time';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    hintText: "Contact Number",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "Order Summary",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    final product = widget.products[index];
                    return ListTile(
                      title: Text(
                        product['name'],
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      subtitle: Text(
                        "Quantity: ${product['quantity']} - Price: ₱ ${product['price']}",
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount:",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "₱ ${widget.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFF090C9B),
                        width: 1.0,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final filteredProducts =
                              widget.products.map((product) {
                                return {
                                  'name': product['name'],
                                  'quantity': product['quantity'],
                                  'price': product['price'],
                                };
                              }).toList();

                          // Create order object
                          final orderDetails = {
                            'name': _nameController.text,
                            'dateTime': _dateTimeController.text,
                            'contact': _contactController.text,
                            'email': _emailController.text,
                            'amount': widget.totalAmount,
                            'products':
                                filteredProducts, // Use filtered products
                          };

                          // Send order details to Google Sheet
                          _sendOrderToGoogleSheet(orderDetails);

                          // Call the callback to notify the parent widget
                          widget.onCheckoutComplete();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: const Color(0xFF090C9B),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle, size: 20.0),
                          const SizedBox(width: 8.0),
                          const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF090C9B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
