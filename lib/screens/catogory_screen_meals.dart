import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app_navigation/widgets/category_item.dart';
import 'package:meal_app_navigation/dummy_data.dart';
import 'package:meal_app_navigation/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryID;
  // final String title;
  // const CategoryMealScreen({super.key, required this.categoryID, required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgu =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final  CategoryTitle = routeArgu['title'];
    final categoryID = routeArgu['id'];
    final catogeryMeals =DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryID);

    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade700,
        title: Text(CategoryTitle.toString()),
      ),
      body: Container(
           color: Colors.pink.shade50,
           child: ListView.builder(itemBuilder: (ctx , index){
            return MealItem(
              title:catogeryMeals[index].title, 
              imgurl: catogeryMeals[index].imageUrl, 
              duration: catogeryMeals[index].duration, 
              affordability: catogeryMeals[index].affordability, 
              complexity: catogeryMeals[index].complexity);
           }, itemCount: catogeryMeals.length ,
           ),
      ),
    );
  }
}
