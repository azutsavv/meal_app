import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app_navigation/models/meal.dart';

import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return const Center(
        child: Text('Add your favourite dishes.'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: favouriteMeal[index].id,
                title: favouriteMeal[index].title,
                imgurl: favouriteMeal[index].imageUrl,
                duration: favouriteMeal[index].duration,
                affordability: favouriteMeal[index].affordability,
                complexity: favouriteMeal[index].complexity);
          },
          itemCount: favouriteMeal.length);
    }
  }
}
