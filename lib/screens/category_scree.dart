import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_navigation/widgets/category_item.dart';
import '../dummy_data.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
            .toList());
  }
}
