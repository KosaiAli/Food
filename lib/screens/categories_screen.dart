import 'package:flutter/material.dart';

import 'package:food/widgets/category_item.dart';
import 'package:food/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DeliMeal',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: dummyCategoris
              .map((catData) => CategoryItem(
                    title: catData.title,
                    color: catData.color,
                    id: catData.id,
                  ))
              .toList(),
        ),
      ),
    );
  }
}