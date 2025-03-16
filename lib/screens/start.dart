import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0; // Track the active index of the carousel

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
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update the active index
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            // Carousel Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  [0, 1, 2].map((index) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index
                                ? Colors
                                    .white // Active dot color
                                : Colors.grey, // Inactive dot color
                      ),
                    );
                  }).toList(),
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
