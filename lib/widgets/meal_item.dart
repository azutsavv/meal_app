import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app_navigation/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imgurl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;


  const MealItem({super.key, required this.title, required this.imgurl, required this.duration, required this.affordability, required this.complexity});
  void SelectMeal() {}
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => SelectMeal(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children:  [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imgurl,
                      height: 250 , 
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      ) , 
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
