part of 'fetch_favorite_recipe_cubit.dart';

@immutable
sealed class FetchFavoriteRecipeState {}

final class FetchFavoriteRecipeInitial extends FetchFavoriteRecipeState {}
final class FetchFavoriteRecipeLoading extends FetchFavoriteRecipeState {}
final class FetchFavoriteRecipeSuccess extends FetchFavoriteRecipeState {
  final List<Recipe> recipe;
  FetchFavoriteRecipeSuccess({required this.recipe});
}
final class FetchFavoriteRecipeFailure extends FetchFavoriteRecipeState {
  final String error;
  FetchFavoriteRecipeFailure({required this.error});
}
