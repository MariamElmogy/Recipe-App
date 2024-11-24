import 'package:dartz/dartz.dart';
import 'package:recipe_app/screens/account/data/repo/account_repo.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe_database.dart';

class AccountRepoImplement implements AccountRepo {
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
