part of 'fetch_recipe_cubit.dart';

@immutable
sealed class FetchRecipeState {}

final class FetchRecipeInitial extends FetchRecipeState {}

final class FetchRecipeLoading extends FetchRecipeState {}

final class FetchRecipeSuccess extends FetchRecipeState {
  final List<Recipe> recipes;
  FetchRecipeSuccess({required this.recipes});
}

final class FetchRecipeFailure extends FetchRecipeState {
  final String errorMessage;
  FetchRecipeFailure({required this.errorMessage});
}
