import 'package:flutter/material.dart';
import 'package:meal_app_navigation/fonts/fonts.dart';
import 'package:meal_app_navigation/screens/category_scree.dart';
import 'package:meal_app_navigation/screens/favourite_screen.dart';
import 'package:meal_app_navigation/widgets/main_Drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  TabScreen(this.favouriteMeal);
  List<Meal>favouriteMeal;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 late List<Map<String, dynamic>> _Pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _Pages  = [
    {'pages': const categoryScreen(), 'title': 'Category'},
    {'pages': FavouriteScreen(widget.favouriteMeal), 'title': 'Favourite'},
  ];
    super.initState();
  }
  
  

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title_font(
          text: _Pages[_selectedPageIndex]['title'],
          colors: Colors.white,
        ),
        backgroundColor: Colors.purple.shade700,
      ),
      body: _Pages[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple.shade700,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.pinkAccent.shade100,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.purple.shade700,
                icon: const Icon(Icons.category_outlined),
                label: 'Category'),
            BottomNavigationBarItem(
                backgroundColor: Colors.purple.shade700,
                icon: const Icon(Icons.favorite_outline),
                label: 'Favourite')
          ]),
      drawer: const MainDrawer(),
    );
  }
}
