import 'package:flutter/material.dart';

import 'catogory_screen_meals.dart';
import 'fonts/fonts.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color colors;
  const categoryItem({super.key, required this.colors, required this.title, required this.id});
void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return CategoryMealScreen(categoryID: id, title: title,);
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () => selectCategory(context),
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colors.withOpacity(0.8), colors],
              begin: Alignment.topRight,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: title_font(
          text: title,
        ),
      ),
    )
    );
  }
}
