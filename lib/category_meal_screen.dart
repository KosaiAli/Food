import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'CategoryMealScreen';

  const CategoryMealScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
