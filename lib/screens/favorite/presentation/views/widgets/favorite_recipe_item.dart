import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/custom/image_container.dart';
import 'package:recipe_app/core/custom/my_favorite_container.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/favorite/presentation/manager/cubit/fetch_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/manager/toggle_favorite_recipe_cubit/toggle_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/views/detail_recipe_view.dart';

class FavoriteRecipeItem extends StatefulWidget {
  const FavoriteRecipeItem({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<FavoriteRecipeItem> createState() => _FavoriteRecipeItemState();
}

class _FavoriteRecipeItemState extends State<FavoriteRecipeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailRecipeView(recipe: widget.recipe),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF063336).withOpacity(.2),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImageContainer(image: widget.recipe.image),
                Positioned(
                  top: 10,
                  right: 10,
                  child: MyFavoriteContainer(
                    recipe: widget.recipe,
                    onPressed: () {
                      BlocProvider.of<ToggleFavoriteRecipeCubit>(context)
                          .toggleFavoriteRecipe(recipe: widget.recipe)
                          .then((_) {
                        BlocProvider.of<FetchFavoriteRecipeCubit>(context)
                            .fetchRecipe();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.height * .01),
            Text(
              widget.recipe.name!,
              style: AppFontStyles.styleBold20(context).copyWith(
                color: AppColors.titleColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: SizeConfig.height * .01),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 16,
                ),
                SizedBox(width: SizeConfig.width * .01),
                Text(
                  "${widget.recipe.rating}/5.0",
                  style: AppFontStyles.styleRegular16(context).copyWith(
                    color: const Color(0XFF97A2B0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
