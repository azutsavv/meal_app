import 'package:flutter/material.dart';
import 'package:meal_app_navigation/dummy_data.dart';
import 'package:meal_app_navigation/fonts/fonts.dart';

class MealDetailDcreen extends StatelessWidget {
  static const routeName = '/MealDetailScreen';
  final Function toogleFavourite;
  final Function isfavourite;
  const MealDetailDcreen(this.toogleFavourite, this.isfavourite );

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: Colors.deepPurpleAccent.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            child: Material(
              elevation: 10,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.maxFinite,
                height: 280,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.deepPurpleAccent.shade700,
                      style: BorderStyle.solid,
                      width: 3),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey.shade50),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    const title_font(text: 'Idgredients'),
                    Container(
                      height: 150,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: selectedMeal.ingredients.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              leading: Text('${(index + 1)}'),
                              title: Text(selectedMeal.ingredients[index]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.deepPurpleAccent.shade700,
                      style: BorderStyle.solid,
                      width: 3),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey.shade50),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    const title_font(text: 'Steps'),
                    Container(
                      height: 230,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: selectedMeal.steps.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              leading: Text('${(index + 1)} .'),
                              title: Text(selectedMeal.steps[index]),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:() => toogleFavourite(mealID),
          child: Icon(isfavourite(mealID) ? Icons.star : Icons.star_border)),
    );
  }
}
