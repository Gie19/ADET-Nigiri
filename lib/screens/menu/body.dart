import 'package:flutter/material.dart';
import 'package:practiceapp/screens/menu/products/product1/product1.dart';
import 'package:practiceapp/screens/menu/products/product10/product10.dart';
import 'package:practiceapp/screens/menu/products/product11/product11.dart';
import 'package:practiceapp/screens/menu/products/product12/product12.dart';
import 'package:practiceapp/screens/menu/products/product2/product2.dart';
import 'package:practiceapp/screens/menu/products/product3/product3.dart';
import 'package:practiceapp/screens/menu/products/product4/product4.dart';
import 'package:practiceapp/screens/menu/products/product5/product5.dart';
import 'package:practiceapp/screens/menu/products/product6/product6.dart';
import 'package:practiceapp/screens/menu/products/product7/product7.dart';
import 'package:practiceapp/screens/menu/products/product8/product8.dart';
import 'package:practiceapp/screens/menu/products/product9/product9.dart';

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
                  Expanded(child: ProductOne()),
                  Expanded(child: ProductTwo()),
                ],
              ),
              SizedBox(height: 16.0),
              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProductThree()),
                  Expanded(child: ProductFour()),
                ],
              ),
              SizedBox(height: 16.0),
              // Third Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProductFive()),
                  Expanded(child: ProductSix()),
                ],
              ),
              SizedBox(height: 16.0),
              // Fourth Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProductSeven()),
                  Expanded(child: ProductEight()),
                ],
              ),
              SizedBox(height: 16.0),
              // Fifth Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProductNine()),
                  Expanded(child: ProductTen()),
                ],
              ),
              SizedBox(height: 16.0),
              // Sixth Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProductEleven()),
                  Expanded(child: ProductTwelve()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
