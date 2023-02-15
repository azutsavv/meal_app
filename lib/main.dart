import 'package:flutter/material.dart';
import 'package:meal_app_navigation/category_scree.dart';
import 'package:meal_app_navigation/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'chk',
      routes: {
        'home': (context) => const landingpage(),
        'chk':(context) => const categoryScreen()
      },

    );
  }
}
 