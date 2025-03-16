import 'package:flutter/material.dart';
import 'package:practiceapp/screens/navbars/botbar.dart';
import 'package:practiceapp/screens/navbars/topbar.dart';
import 'package:practiceapp/utils/favorites_manager.dart';

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
      body:
          favorites.isEmpty
              ? const Center(
                child: Text(
                  "No favorites added yet!",
                  style: TextStyle(fontSize: 18.0),
                ),
              )
              : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final favorite = favorites[index];
                  return ListTile(
                    leading: Image.asset(
                      favorite['image'],
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(favorite['name']),
                    subtitle: Text("\$${favorite['price']}"),
                  );
                },
              ),
      bottomNavigationBar: BotBar(),
    );
  }
}
