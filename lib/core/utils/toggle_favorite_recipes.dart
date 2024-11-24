import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe_database.dart';

Future<void> toggleFavoriteRecipes(Recipe recipe, RecipeDatabase db) async {
  // Flip the `isFavorite` status
  recipe.isFavorite = !recipe.isFavorite;
  // Update the database accordingly
  if (recipe.isFavorite) {
    await db.addFavoriteRecipe(favoriteRecipe: recipe);
  } else {
    await db.removeFavoriteRecipe(recipeId: recipe.id!);
  }
}
