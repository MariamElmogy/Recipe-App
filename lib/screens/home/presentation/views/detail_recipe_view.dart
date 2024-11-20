import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/detail_recipe_view_body.dart';

class DetailRecipeView extends StatelessWidget {
  const DetailRecipeView({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DetailRecipeViewBody(recipe: recipe),
        ),
      ),
    );
  }
}
