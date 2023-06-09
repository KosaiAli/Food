import 'dart:developer';

import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {super.key});
  static const String routeName = 'MealDetailScreen';
  final Function toggleFavorite;
  final Function isFavorite;
  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final scrollController = ScrollController();

  late double offsetY;
  late double widgeheight;
  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final meal = dummymeals.firstWhere((element) => element.id == id);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          widget.toggleFavorite(id);
        },
        child: Icon(
          widget.isFavorite(id) ? Icons.favorite : Icons.favorite_border,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: meal.imageUrl,
                      child: Image.network(
                        meal.imageUrl,
                        width: double.infinity,
                        height: size.height * 0.35,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: LayoutBuilder(
                        builder: (ctx, cons) {
                          try {
                            final renderObject =
                                ctx.findRenderObject() as RenderBox;

                            offsetY =
                                renderObject.localToGlobal(Offset.zero).dy;
                            widgeheight = renderObject.size.height;
                          } catch (e) {
                            log(e.toString());
                          }
                          return Hero(
                            tag: meal.title,
                            child: Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.black38,
                              ),
                              child: Text(
                                meal.title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 26),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ingredients :',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: meal.ingredients
                        .map((e) => Text(
                              '- $e',
                              style: const TextStyle(height: 1.5, fontSize: 16),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Steps :',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 16),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: meal.steps
                        .map(
                          (e) => Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.pink.shade500,
                                    radius: 25,
                                    child: Text(
                                      '#${meal.steps.indexOf(e) + 1}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          height: 1.5, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  color: Colors.black45,
                                ),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
