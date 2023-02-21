import 'package:flutter/material.dart';
import 'package:meal_app_navigation/screens/category_scree.dart';
import 'package:meal_app_navigation/screens/catogory_screen_meals.dart';
import 'package:meal_app_navigation/screens/filters_screen.dart';
import 'package:meal_app_navigation/screens/meal_detail_screen.dart';
import 'package:meal_app_navigation/screens/tabs_screen.dart';


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
      initialRoute: './',
      routes: {
        './':(context) => TabScreen(),
        FilterScreen.routeName : (context) => FilterScreen(),
        CategoryMealScreen.routeName:(context) => CategoryMealScreen(),
        MealDetailDcreen.routeName:(context) =>  MealDetailDcreen(),
          },

    );
  }
}
 