import 'package:flutter/material.dart';
import 'package:practiceapp/screens/menu/products/product12/product12card.dart';

class ProductTwelve extends StatelessWidget {
  const ProductTwelve({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductTwelveCard()),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Image
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/product12.JPG"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Kian’s Tofu",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Helvetica",
                ),
              ),
              const SizedBox(height: 5),

              const Text(
                "₱ 180.00",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Helvetica",
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
