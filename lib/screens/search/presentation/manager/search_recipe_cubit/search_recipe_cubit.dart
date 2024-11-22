import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/search/data/repo/search_repo.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit(this.searchRepo) : super(SearchRecipeInitial());
  final SearchRepo searchRepo;

  Future<void> searchRecipes({required String food}) async {
    emit(SearchRecipeLoading());
    var result = await searchRepo.searchRecipes(food: food);
    result.fold(
      (failure) => emit(SearchRecipeFailure(error: failure)),
      (recipe) => emit(SearchRecipeSuccess(recipes: recipe)),
    );
  }
}
