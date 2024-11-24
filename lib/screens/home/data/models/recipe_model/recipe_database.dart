import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';

class RecipeDatabase {
  static late Isar isar;

  // INITIALIZE - DATABASE
  static Future<void> initialize() async {
    final dir =
        await getApplicationDocumentsDirectory(); // get the path to know where to save the database
    isar = await Isar.open(
      [RecipeSchema],
      directory: dir.path,
    ); // initialize Isar with the directory path
  }

  Future<void> addFavoriteRecipe({required Recipe favoriteRecipe}) async {
    await isar.writeTxn(() async {
      favoriteRecipe.isFavorite = true;
      await isar.recipes.put(favoriteRecipe);
    });
  }

  // Remove a recipe from favorites
  Future<void> removeFavoriteRecipe({required int recipeId}) async {
    await isar.writeTxn(() async {
      await isar.recipes.delete(recipeId); // Delete recipe by ID
    });
  }

  // Fetch all favorite recipes
  Future<List<Recipe>> fetchFavoriteRecipes() async {
    return await isar.recipes.filter().isFavoriteEqualTo(true).findAll();
  }

  // Toggle favorite status
  Future<void> toggleFavoriteStatus({required Recipe recipe}) async {
    await isar.writeTxn(() async {
      recipe.isFavorite = !recipe.isFavorite;
      await isar.recipes.put(recipe);
    });
  }
}
