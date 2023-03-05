import 'package:flutter/material.dart';
import 'package:meal_app_navigation/dummy_data.dart';
import 'package:meal_app_navigation/models/meal.dart';
import 'package:meal_app_navigation/screens/catogory_screen_meals.dart';
import 'package:meal_app_navigation/screens/filters_screen.dart';
import 'package:meal_app_navigation/screens/meal_detail_screen.dart';
import 'package:meal_app_navigation/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vagan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  List<Meal> _favouriteMeal = [];

  void _setFilter(Map<String, bool> filterdata) {
    setState(() {
      _filter = filterdata;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filter['gluten']! && !meal.isGlutenFree) {
          return false;
        }

        if (_filter['lactose']! && !meal.isLactoseFree) {
          return false;
        }

        if (_filter['vegan']! && !meal.isVegan) {
          return false;
        }

        if (_filter['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toogleFavourite(String mealid) {
    final existingIndex =
        _favouriteMeal.indexWhere((meal) => meal.id == mealid);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });
    }
  }

  bool _isFavouriteMeal(String id) {
    return _favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: './',
      routes: {
        './': (context) => TabScreen(_favouriteMeal),
        FilterScreen.routeName: (context) =>
            FilterScreen(saveFIlter: _setFilter),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeal),
        MealDetailDcreen.routeName: (context) =>
            MealDetailDcreen(_toogleFavourite,_isFavouriteMeal),
      },
    );
  }
}
