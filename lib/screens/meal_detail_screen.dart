import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MealDetailDcreen extends StatelessWidget {
  const MealDetailDcreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body : Center(child: Text('Meal Details - $mealID')),
      
    );
  }
}
 