import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe.dart';
import 'package:recipe_app/screens/home/presentation/manager/toggle_favorite_recipe_cubit/toggle_favorite_recipe_cubit.dart';

class MyFavoriteContainer extends StatefulWidget {
  const MyFavoriteContainer({super.key, required this.recipe, this.onPressed});
  final Recipe recipe;
  final  Function()? onPressed;

  @override
  State<MyFavoriteContainer> createState() => _MyFavoriteContainerState();
}

class _MyFavoriteContainerState extends State<MyFavoriteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * .07,
      height: SizeConfig.height * .04,
      decoration: BoxDecoration(
        color: const Color(0XFFFFFFFF).withOpacity(.8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        icon: Icon(
          widget.recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.recipe.isFavorite ? Colors.red : Colors.grey,
          size: 16,
        ),
        onPressed: widget.onPressed?? () {
          setState(() {
            BlocProvider.of<ToggleFavoriteRecipeCubit>(context)
                .toggleFavoriteRecipe(recipe: widget.recipe);
          });
        },
      ),
    );
  }
}
