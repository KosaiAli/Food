import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filter_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_dtail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _filteredMeals = dummymeals;
  void _setFilter(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      _filteredMeals = dummymeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
        colorScheme: const ColorScheme.light(primary: Colors.pink),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TabScreen(),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_filteredMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(_setFilter, _filters)
      },
    );
  }
}
