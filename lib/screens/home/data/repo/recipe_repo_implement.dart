import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/core/utils/api_service.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo.dart';

class RecipeRepoImplement implements RecipeRepo {
  final ApiService apiService;
  RecipeRepoImplement(this.apiService);

  @override
  Future<Either<String, List<Recipe>>> fetchRecipe({required String meal}) async {
    try {
      var data = await apiService.get(endpoint: "/meal-type/$meal");
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
