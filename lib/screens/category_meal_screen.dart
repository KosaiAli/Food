import 'package:flutter/material.dart';
import 'package:food/dummy_data.dart';
import 'package:food/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'CategoryMealScreen';

  const CategoryMealScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final title = arguments['title'];
    final categoryId = arguments['id'];
    final categoryMeals = dummymeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
