import 'package:flutter/material.dart';

import './screens/meal_dtail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: CategoriesScreen.routeName,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealScreen.routeName: (context) => const CategoryMealScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen()
      },
    );
  }
}
