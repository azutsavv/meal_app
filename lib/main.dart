import 'package:flutter/material.dart';
import 'package:meal_app_navigation/screens/category_scree.dart';
import 'package:meal_app_navigation/screens/catogory_screen_meals.dart';
import 'package:meal_app_navigation/screens/meal_detail_screen.dart';


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
        
        'chk':(context) => const categoryScreen(),
        'catmeal':(context) => CategoryMealScreen(),
        'mealdetail':(context) => MealDetailDcreen(),
      },

    );
  }
}
 