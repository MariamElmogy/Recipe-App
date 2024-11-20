import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/bar_recipe_detail.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/recipe_ingredients.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/recipe_instructions.dart';

class RecipeDetailTabBar extends StatefulWidget {
  const RecipeDetailTabBar({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<RecipeDetailTabBar> createState() => _RecipeDetailTabBarState();
}

class _RecipeDetailTabBarState extends State<RecipeDetailTabBar> {
  int selectedIndex = 0;
  List<String> items = ["Ingredients", "Instructions"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0XFFE6EBF2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => updateIndex(0),
                  child: BarRecipeDetail(
                    text: items[0],
                    isSelected: selectedIndex == 0,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => updateIndex(1),
                  child: BarRecipeDetail(
                    text: items[1],
                    isSelected: selectedIndex == 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.height * .03),
        selectedIndex == 0
            ? RecipeIngredients(recipe: widget.recipe)
            : RecipeInstructions(recipe: widget.recipe)
      ],
    );
  }

  updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
