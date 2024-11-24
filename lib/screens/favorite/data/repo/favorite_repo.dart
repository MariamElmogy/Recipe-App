import 'package:dartz/dartz.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

abstract class FavoriteRepo {
  Future<Either<String, List<Recipe>>> fetchFavoriteRecipes();
}
