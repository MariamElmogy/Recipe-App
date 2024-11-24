import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/screens/favorite/data/repo/favorite_repo.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

part 'fetch_favorite_recipe_state.dart';

class FetchFavoriteRecipeCubit extends Cubit<FetchFavoriteRecipeState> {
  FetchFavoriteRecipeCubit(this.repo) : super(FetchFavoriteRecipeInitial());
  final FavoriteRepo repo;

  Future<void> fetchRecipe() async {
    emit(FetchFavoriteRecipeLoading());
    var result = await repo.fetchFavoriteRecipes();
    result.fold(
      (failure) {
        log("Failed to fetch: $failure");
        emit(FetchFavoriteRecipeFailure(error: failure));
      },
      (recipe) {
        emit(FetchFavoriteRecipeSuccess(recipe: recipe));
      },
    );
  }
}
