import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryID;
  final String title;
  const CategoryMealScreen({super.key, required this.categoryID, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade700,
        title: Text(title),
      ),
      body: Container(
        color: Colors.pink.shade50,
      ),
    );
  }
}
