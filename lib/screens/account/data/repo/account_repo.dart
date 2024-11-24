import 'package:dartz/dartz.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

abstract class AccountRepo {
  Future<Either<String, List<Recipe>>> fetchFavoriteRecipes();
}
