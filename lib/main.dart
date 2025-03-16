import 'package:flutter/material.dart';
import 'package:practiceapp/screens/start.dart';
import 'package:practiceapp/screens/menu/menu.dart';
import 'package:practiceapp/screens/favorite.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Nigiri Station",
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      routes: {
        '/menu': (context) => MenuPage(),
        '/favorites': (context) => FavoritesPage(),
      },
    ),
  );
}
