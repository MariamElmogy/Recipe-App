import 'package:dartz/dartz.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

abstract class RecipeRepo {
  Future<Either<String, void>> toggleFavoriteRecipe({required Recipe recipe});
  Future<Either<String, List<Recipe>>> fetchRecipe({required String meal});
  // Future<Either<String, void>> removeFavoriteRecipe({required Recipe recipe});
}
