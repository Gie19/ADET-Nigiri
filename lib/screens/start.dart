import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;

  final List<Map<String, String>> carouselItems = [
    {
      "title": "Welcome to Nigiri Station!",
      "subtitle":
          "Get your favorite Nigiri Station's onigiri anytime, anywhere!",
      "logo": "assets/images/logo1.png",
    },
    {
      "image": "assets/images/start1.jpg",
      "title": "Easy Ordering Process!",
      "subtitle":
          "Order your favorite onigiri in just a few taps! Select your items and choose your pickup time.",
    },
    {
      "image": "assets/images/start2.jpg",
      "title": "Save Your Favorites!",
      "subtitle": "Easily reorder your go-to onigiri with a single tap.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            color: const Color(0xFF001489),
            alignment: Alignment.center,
            child:
                _currentIndex == 0
                    ? Image.asset(
                      "assets/images/logo1.png",
                      width: 150,
                      fit: BoxFit.contain,
                    )
                    : Image.asset(
                      carouselItems[_currentIndex]["image"] ??
                          "assets/images/start1.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFF001489),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  CarouselSlider(
                    items:
                        carouselItems.map((item) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item["title"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item["subtitle"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                    options: CarouselOptions(
                      height: 180.0,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 140),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(carouselItems.length, (index) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentIndex == index
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 55),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF001489),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18, fontFamily: "Helvetica"),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/menu");
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
