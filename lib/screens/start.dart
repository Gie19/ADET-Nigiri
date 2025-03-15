import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF090C9B), // Set the background color to #090c9b
        child: ListView(
          children: [
            // Custom logo at the top
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset("assets/images/logo1.png", height: 100.0),
              ),
            ),
            const SizedBox(height: 20),
            // Carousel Slider
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/nigiri1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/nigiri1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/nigiri1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 600.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 20),
            // Welcome Text and Button
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Welcome to Nigiri Station!",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 24,
                      color: Colors.white, // Change text color to white
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: const Color(
                        0xFF090C9B,
                      ), // Button text color
                    ),
                    child: const Text(
                      "Start Ordering",
                      style: TextStyle(fontFamily: 'OpenSans'),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/menu");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
