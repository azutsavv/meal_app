import 'package:flutter/material.dart';
import 'package:meal_app_navigation/models/meal.dart';
import 'package:meal_app_navigation/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgurl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imgurl,
      required this.duration,
      required this.affordability,
      required this.complexity,
    });

  void SelectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailDcreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
      //  removeItem(result);
      }
    });
  }

  String get complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricy';
      case Affordability.Luxurious:
        return 'Expensive';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => SelectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imgurl,
                      height: 250,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 35,
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.pink.shade50,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule),
                          const SizedBox(
                            width: 4,
                          ),
                          Text('$duration min'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(complexitytext),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.currency_rupee),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(affordabilitytext),
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
