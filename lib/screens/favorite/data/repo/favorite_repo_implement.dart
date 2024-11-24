import 'package:dartz/dartz.dart';
import 'package:recipe_app/screens/favorite/data/repo/favorite_repo.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe_database.dart';

class FavoriteRepoImplement implements FavoriteRepo {
  RecipeDatabase db = RecipeDatabase();

  @override
  Future<Either<String, List<Recipe>>> fetchFavoriteRecipes() async {
    try {
      var favoriteRecipes = await db.fetchFavoriteRecipes();
      return right(favoriteRecipes);
    } catch (e) {
      return left('Error fetching recipes: $e');
    }
  }
}
