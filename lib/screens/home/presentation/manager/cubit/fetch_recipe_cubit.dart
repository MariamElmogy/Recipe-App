import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo.dart';

part 'fetch_recipe_state.dart';

class FetchRecipeCubit extends Cubit<FetchRecipeState> {
  FetchRecipeCubit(this.recipeRepo) : super(FetchRecipeInitial());
  final RecipeRepo recipeRepo;

  Future<void> fetchRecipe({required String meal}) async {
    emit(FetchRecipeLoading());
    var result = await recipeRepo.fetchRecipe(meal: meal);
    result.fold(
      (failure) {
        log("Failed to fetch: $failure");
        emit(FetchRecipeFailure(errorMessage: failure));
      },
      (recipe) {
        emit(FetchRecipeSuccess(recipes: recipe));
      },
    );
  }
}
