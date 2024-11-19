import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/popular_item.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * .26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return PopularItem(recipe: recipes[index]);
        },
      ),
    );
  }
}
