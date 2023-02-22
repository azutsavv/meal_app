import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon,final  Function() tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontFamily: 'RobotoCondensed'),
      ),
      onTap: tapHandler,
    );
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(10),
            color: Colors.purple.shade700,
            child: const Text(
              'Cooking Up !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushNamed('./');
          }),
          const SizedBox(
            height: 10,
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
