import 'package:flutter/material.dart';
import 'package:practiceapp/screens/navbars/botbar.dart';
import 'package:practiceapp/screens/navbars/topbar.dart';
import 'package:practiceapp/utils/favorites_manager.dart';
import 'package:practiceapp/utils/cart_manager.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesManager.getFavorites();
    return Scaffold(
      appBar: TopBar(),
      drawer: TopBar.buildDrawer(context),
      body: Container(
        color: const Color(0xFF090C9B),
        child:
            favorites.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 80.0, // Large icon size
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "No favorites added yet!",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: "Helvetica",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Add items to your favorites to see them here.",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Helvetica",
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
                : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Favorites",
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: favorites.length,
                        separatorBuilder:
                            (context, index) => const Divider(
                              color: Colors.white,
                              thickness: 1.0,
                              indent: 30.0,
                              endIndent: 30.0,
                            ),
                        itemBuilder: (context, index) {
                          final favorite = favorites[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 80.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    favorite['image'],
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          favorite['name'],
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                FavoritesManager.removeFavorite(
                                                  favorite,
                                                );
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                CartManager.addToCart(
                                                  favorite,
                                                  1,
                                                );
                                              });
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.check_circle,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Added to cart!",
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                        255,
                                                        76,
                                                        97,
                                                        175,
                                                      ),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  duration: const Duration(
                                                    seconds: 2,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.0,
                                                        ),
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
      bottomNavigationBar: BotBar(),
    );
  }
}
