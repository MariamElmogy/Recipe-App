import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/custom/recipe_loading_widget.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:recipe_app/screens/search/presentation/views/widgets/popular_category_widget.dart';

class SearchResultRecipeBlocBuilder extends StatelessWidget {
  const SearchResultRecipeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
      builder: (context, state) {
        if (state is SearchRecipeSuccess) {
          if (state.recipes.isEmpty) return _recipeInvalid(context);
          return PopularCategoryWidget(recipes: state.recipes);
        } else if (state is SearchRecipeFailure) {
          return Text('Failed to fetch popular recipes: ${state.error}');
        }
        return const RecipeLoadingWidget(text: "Searching for a recipe...");
      },
    );
  }

  Column _recipeInvalid(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.height * .1,
        ),
        const Icon(
          Icons.cancel_outlined,
          color: Color(0XFFC8340F),
          size: 50,
        ),
        SizedBox(
          height: SizeConfig.height * .04,
        ),
        Text(
          "Could not find the recipe",
          style: AppFontStyles.styleRegular18(context).copyWith(
            color: const Color(0XFF97A2B0),
          ),
        ),
      ],
    );
  }
}
