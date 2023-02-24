import 'package:flutter/material.dart';
import 'package:meal_app_navigation/fonts/fonts.dart';
import 'package:meal_app_navigation/widgets/main_Drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  
  final Function(Map<String, bool>) saveFIlter;
  const FilterScreen(
      {super.key, required this.saveFIlter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _vegetarian = false;
  bool __GlutenFree = false;
  bool _Lactose = false;
  bool _Vegan = false;

  Widget _buildSwitchList(String title, String subtitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'gluten': __GlutenFree,
                'lactose': _Lactose,
                'vagan': _Vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFIlter(selectedFilter);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const title_font(text: 'Adjust Your Meal Filter'),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchList(
                  'Gluten-Free', 'Your Food is Gluten Free', __GlutenFree,
                  (newValue) {
                setState(() {
                  __GlutenFree = newValue;
                });
              }),
              _buildSwitchList(
                  'Vegetarian', 'Your Food is Vegetarian', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchList('Vegan', 'Your Food is Vegan', _Vegan,
                  (newValue) {
                setState(() {
                  _Vegan = newValue;
                });
              }),
              _buildSwitchList(
                  'Lactose Free', 'Your Food is Lactose Free', _Lactose,
                  (newValue) {
                setState(() {
                  _Lactose = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
