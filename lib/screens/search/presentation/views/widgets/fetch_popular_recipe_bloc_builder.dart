import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/search/presentation/manager/fetch_popular_recipe_cubit/fetch_popular_recipe_cubit.dart';
import 'package:recipe_app/screens/search/presentation/views/widgets/popular_category_widget.dart';

class FetchPopularRecipeBlocBuilder extends StatelessWidget {
  const FetchPopularRecipeBlocBuilder({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularRecipeCubit, FetchPopularRecipeState>(
      builder: (context, state) {
        if (state is FetchPopularRecipeSuccess) {
          final filteredRecipes = state.recipes
              .where((recipe) => recipe.mealType!.contains(category))
              .toList();
          return PopularCategoryWidget(recipes: filteredRecipes);
        } else if (state is FetchPopularRecipeFailure) {
          return Text('Failed to fetch popular recipes: ${state.error}');
        }
        return Column(
          children: [
            SizedBox(
              height: SizeConfig.height * .1,
            ),
            const Icon(
              Icons.cookie_outlined,
              color: Color(0XFF97A2B0),
            ),
            Text(
              "$category Loading...",
              style: AppFontStyles.styleRegular14(context),
            ),
          ],
        );
      },
    );
  }
}
