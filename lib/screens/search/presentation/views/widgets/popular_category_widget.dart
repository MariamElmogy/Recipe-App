import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/search/presentation/views/widgets/popular_category_item.dart';

class PopularCategoryWidget extends StatelessWidget {
  const PopularCategoryWidget({super.key, required this.recipes});
  final List<Recipe> recipes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PopularCategoryItem(recipe: recipes[index]);
      },
    );
  }
}
