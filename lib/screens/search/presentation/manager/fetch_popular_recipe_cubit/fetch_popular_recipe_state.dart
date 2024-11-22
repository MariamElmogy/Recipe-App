part of 'fetch_popular_recipe_cubit.dart';

@immutable
abstract class FetchPopularRecipeState {}

final class FetchPopularRecipeInitial extends FetchPopularRecipeState {}

final class FetchPopularRecipeLoading extends FetchPopularRecipeState {}

final class FetchPopularRecipeSuccess extends FetchPopularRecipeState {
  final List<Recipe> recipes;
  FetchPopularRecipeSuccess({required this.recipes});
}

final class FetchPopularRecipeFailure extends FetchPopularRecipeState {
  final String error;
  FetchPopularRecipeFailure({required this.error});
}
