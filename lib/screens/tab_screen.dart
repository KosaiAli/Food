import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const routeName = 'TabScreen';
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeal'),
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
