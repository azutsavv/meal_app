import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app_navigation/category_item.dart';
import 'package:meal_app_navigation/catogory_screen_meals.dart';
import './dummy_data.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent.shade700,
          title: Text('Meal'),
        ),
        body: GridView(
            padding: EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: DUMMY_CATEGORIES
                .map((e) => categoryItem(
                      id: e.id,
                      colors: e.colors,
                      title: e.title,
                    ))
                .toList()),
      ),
    );
  }
}
