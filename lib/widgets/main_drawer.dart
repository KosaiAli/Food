import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  Widget _buildListTile(IconData icon, String title, Function() tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).viewPadding.top + 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          _buildListTile(Icons.restaurant, 'Meals',
              () => Navigator.of(context).pushReplacementNamed('/')),
          const SizedBox(height: 20),
          _buildListTile(
              Icons.settings,
              'Filters',
              () => Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName))
        ],
      ),
    );
  }
}
