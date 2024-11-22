import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/search/data/repo/search_repo.dart';

part 'fetch_popular_recipe_state.dart';

class FetchPopularRecipeCubit extends Cubit<FetchPopularRecipeState> {
  FetchPopularRecipeCubit(this.searchRepo) : super(FetchPopularRecipeInitial());

  final SearchRepo searchRepo;

  Future<void> fetchPopularRecipes({required String meal}) async {
    emit(FetchPopularRecipeLoading());
    var result = await searchRepo.fetchPopularRecipes(meal: meal);
    result.fold(
      (failure) {
        log("Failed to fetch: $failure");
        emit(FetchPopularRecipeFailure(error: failure));
      },
      (recipe) {
        emit(FetchPopularRecipeSuccess(recipes: recipe));
      },
    );
  }
}
