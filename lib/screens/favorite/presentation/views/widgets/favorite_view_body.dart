import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/custom/recipe_loading_widget.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/favorite/presentation/manager/cubit/fetch_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/favorite/presentation/views/widgets/favorite_recipes_grid_view.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height,
      child: BlocBuilder<FetchFavoriteRecipeCubit, FetchFavoriteRecipeState>(
        builder: (context, state) {
          if (state is FetchFavoriteRecipeSuccess) {
            return FavoriteRecipesGridView(recipeList: state.recipe);
          }
          return const Center(
            child: RecipeLoadingWidget(
              text: "Loading your favorite recipe...",
            ),
          );
        },
      ),
    );
  }
}
