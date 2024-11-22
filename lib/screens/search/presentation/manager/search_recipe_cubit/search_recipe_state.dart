part of 'search_recipe_cubit.dart';

@immutable
abstract class SearchRecipeState {}

final class SearchRecipeInitial extends SearchRecipeState {}

final class SearchRecipeLoading extends SearchRecipeState {}

final class SearchRecipeSuccess extends SearchRecipeState {
  final List<Recipe> recipes;
  SearchRecipeSuccess({required this.recipes});
}

final class SearchRecipeFailure extends SearchRecipeState {
  final String error;
  SearchRecipeFailure({required this.error});
}
