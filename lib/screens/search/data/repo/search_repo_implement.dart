import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/core/utils/api_service.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/search/data/repo/search_repo.dart';

class SearchRepoImplement implements SearchRepo {
  SearchRepoImplement(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<String, List<Recipe>>> fetchPopularRecipes(
      {required String meal}) async {
    try {
      var data = await apiService.get(endpoint: "/meal-type/$meal");
      List<Recipe> result = [];
      for (var item in data['recipes']) {
        final recipe = Recipe.fromJson(item);
        if (recipe.rating != null && recipe.rating! > 4.6) {
          result.add(recipe);
        }
      }
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left('Error fetching recipes from dio: ${e.message}');
      }
      return left('Error fetching recipes: $e');
    }
  }

  @override
  Future<Either<String, List<Recipe>>> searchRecipes(
      {required String food}) async {
    try {
      var data = await apiService.get(endpoint: "/search?q=$food");
      List<Recipe> result = [];
      for (var item in data['recipes']) {
        result.add(Recipe.fromJson(item));
      }
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left('Error fetching recipes from dio: ${e.message}');
      }
      return left('Error fetching recipes: $e');
    }
  }
}
