import 'package:flutter/material.dart';
import 'package:recipe_app/core/custom/my_icon_button.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/recipe_detail_item.dart';

class DetailRecipeViewBody extends StatelessWidget {
  const DetailRecipeViewBody({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Hero(
          tag: recipe.image!,
          child: Container(
            height: SizeConfig.height / 2.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(recipe.image!),
              ),
            ),
          ),
        ),
        // Back and notification buttons
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: Row(
            children: [
              MyIconButton(
                icon: Icons.arrow_back_ios_new,
                pressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              MyIconButton(
                icon: Icons.notification_add,
                pressed: () {},
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(0, SizeConfig.height / 2.5),
          child: RecipeDetailItem(recipe: recipe),
        ),
      ],
    );
  }
}
