import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo.dart';

part 'toggle_favorite_recipe_state.dart';

class ToggleFavoriteRecipeCubit extends Cubit<ToggleFavoriteRecipeState> {
  ToggleFavoriteRecipeCubit(this.recipeRepo) : super(ToggleFavoriteRecipeInitial());

   final RecipeRepo recipeRepo;

  Future<void> toggleFavoriteRecipe({required Recipe recipe}) async {
    emit(ToggleFavoriteRecipeLoading());
    var result = await recipeRepo.toggleFavoriteRecipe(recipe: recipe);
    result.fold(
      (failure) {
        log("Failed to fetch: $failure");
        emit(ToggleFavoriteRecipeFailure(error: failure));
      },
      (_) {
        emit(ToggleFavoriteRecipeSuccess(recipe: recipe));
      },
    );
  }
}
