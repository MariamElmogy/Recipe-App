import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo.dart';

part 'fetch_popular_recipe_state.dart';

class FetchPopularRecipeCubit extends Cubit<FetchPopularRecipeState> {
  FetchPopularRecipeCubit(this.recipeRepo) : super(FetchPopularRecipeInitial());
  final RecipeRepo recipeRepo;

  Future<void> fetchPopularRecipe() async {
    emit(FetchPopularRecipeLoading());
    var result = await recipeRepo.fetchPopularRecipe();
    result.fold(
      (failure) {
        log("Failed to fetch: $failure");
        emit(FetchPopularRecipeFailure(errorMessage: failure));
      },
      (recipe) {
        emit(FetchPopularRecipeSuccess(recipes: recipe));
      },
    );
  }
}
