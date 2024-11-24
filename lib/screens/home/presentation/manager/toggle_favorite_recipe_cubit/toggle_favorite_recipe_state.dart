part of 'toggle_favorite_recipe_cubit.dart';

@immutable
sealed class ToggleFavoriteRecipeState {}

final class ToggleFavoriteRecipeInitial extends ToggleFavoriteRecipeState {}

final class ToggleFavoriteRecipeLoading extends ToggleFavoriteRecipeState {}

final class ToggleFavoriteRecipeSuccess extends ToggleFavoriteRecipeState {
  final Recipe recipe;
  ToggleFavoriteRecipeSuccess({required this.recipe});
}

final class ToggleFavoriteRecipeFailure extends ToggleFavoriteRecipeState {
  final String error;

  ToggleFavoriteRecipeFailure({required this.error});
}