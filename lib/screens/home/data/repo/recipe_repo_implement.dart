import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/core/utils/api_service.dart';
import 'package:recipe_app/core/utils/toggle_favorite_recipes.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe_database.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo.dart';

class RecipeRepoImplement implements RecipeRepo {
  final ApiService apiService;
  RecipeDatabase db = RecipeDatabase();
  RecipeRepoImplement(this.apiService);

  @override
  Future<Either<String, List<Recipe>>> fetchRecipe(
      {required String meal}) async {
    try {
      var data = await apiService.get(endpoint: "/meal-type/$meal");
      List<Recipe> result = [];
      // Fetch favorite recipes from local DB
      var favoriteRecipes = await db.fetchFavoriteRecipes();
      var favoriteIds = favoriteRecipes.map((recipe) => recipe.id).toSet();
      // Process fetched recipes and mark them as favorite if they exist in DB
      for (var item in data['recipes']) {
        var recipe = Recipe.fromJson(item);
        recipe.isFavorite = favoriteIds.contains(recipe.id); // Mark as favorite
        result.add(recipe);
      }
      log("length of recipe: ${result.length}");
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left('Error fetching recipes from dio: ${e.message}');
      }
      return left('Error fetching recipes: $e');
    }
  }

  @override
  Future<Either<String, void>> toggleFavoriteRecipe(
      {required Recipe recipe}) async {
    try {
      await toggleFavoriteRecipes(recipe, db);
      await db.fetchFavoriteRecipes();
      return right(null);
    } catch (e) {
      return left('Error toggling favorite status: $e');
    }
  }
}
