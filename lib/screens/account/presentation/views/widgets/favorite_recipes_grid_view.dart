import 'package:flutter/material.dart';
import 'package:recipe_app/screens/account/presentation/views/widgets/favorite_recipe_item.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class FavoriteRecipesGridView extends StatelessWidget {
  const FavoriteRecipesGridView({super.key, required this.recipeList});

  final List<Recipe> recipeList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: recipeList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 4 / 4.5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FavoriteRecipeItem(recipe: recipeList[index]);
      },
    );
  }
}
