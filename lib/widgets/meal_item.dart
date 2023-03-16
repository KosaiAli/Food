import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: selectMeal,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress?.cumulativeBytesLoaded ==
                            loadingProgress?.expectedTotalBytes) {
                          return child;
                        }
                        return Container(
                          width: double.infinity,
                          height: 250,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 26),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule_rounded),
                        const SizedBox(width: 6),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work_outline_rounded),
                        const SizedBox(width: 6),
                        Text(complexity.name),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money_rounded),
                        const SizedBox(width: 6),
                        Text(affordability.name),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}