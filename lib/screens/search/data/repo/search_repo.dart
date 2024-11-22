import 'package:dartz/dartz.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

abstract class SearchRepo {
  Future<Either<String, List<Recipe>>> fetchPopularRecipes(
      {required String meal});
  Future<Either<String, List<Recipe>>> searchRecipes({required String food});
}
