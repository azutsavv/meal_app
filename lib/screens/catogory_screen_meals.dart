import 'package:flutter/material.dart';
import 'package:meal_app_navigation/models/meal.dart';
import 'package:meal_app_navigation/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categoryScreenMeal';

  final List<Meal> availableMeals;
  const CategoryMealScreen(this.availableMeals, {super.key});
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String CategoryTitle;
  late List<Meal> displayitem;
  @override
  void initState() {
    //
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgu =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    CategoryTitle = routeArgu['title']!;
    final categoryID = routeArgu['id'];
    displayitem = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayitem.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryID;
  // final String title;
  // const CategoryMealScreen({super.key, required this.categoryID, required this.title});
  // final String categoryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade700,
        title: Text(CategoryTitle.toString()),
      ),
      body: Container(
        color: Colors.pink.shade50,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayitem[index].id,
                title: displayitem[index].title,
                imgurl: displayitem[index].imageUrl,
                duration: displayitem[index].duration,
                affordability: displayitem[index].affordability,
                complexity: displayitem[index].complexity,
              );
          },
          itemCount: displayitem.length,
        ),
      ),
    );
  }
}
