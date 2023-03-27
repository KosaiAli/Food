import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.favMeals});
  final List<Meal> favMeals;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favMeals.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'You have no favorites yet - start adding some',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          () {
            setState(() {});
          },
          id: widget.favMeals[index].id,
          title: widget.favMeals[index].title,
          imageUrl: widget.favMeals[index].imageUrl,
          duration: widget.favMeals[index].duration,
          complexity: widget.favMeals[index].complexity,
          affordability: widget.favMeals[index].affordability,
        );
      },
      itemCount: widget.favMeals.length,
    );
  }
}
