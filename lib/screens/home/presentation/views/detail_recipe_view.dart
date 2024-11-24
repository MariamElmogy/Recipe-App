import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo_implement.dart';
import 'package:recipe_app/screens/home/presentation/manager/toggle_favorite_recipe_cubit/toggle_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/detail_recipe_view_body.dart';

class DetailRecipeView extends StatelessWidget {
  const DetailRecipeView({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ToggleFavoriteRecipeCubit(getIt.get<RecipeRepoImplement>()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: DetailRecipeViewBody(recipe: recipe),
          ),
        ),
      ),
    );
  }
}
