import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const routeName = 'TabScreen';
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map> _pages = const [
    {
      'page': CategoriesScreen(),
    },
    {'page': FavoriteScreen()},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPage,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
