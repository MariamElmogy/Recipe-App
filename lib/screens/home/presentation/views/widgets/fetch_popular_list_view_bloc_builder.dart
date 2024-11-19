import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/screens/home/presentation/manager/cubit/fetch_popular_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/popular_listview.dart';

class FetchPopularListViewBlocBuilder extends StatelessWidget {
  const FetchPopularListViewBlocBuilder({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularRecipeCubit, FetchPopularRecipeState>(
      builder: (context, state) {
        if (state is FetchPopularRecipeSuccess) {
          final filteredRecipes = state.recipes
              .where((recipe) => recipe.mealType!.contains(category))
              .toList();
          return PopularListView(recipes: filteredRecipes);
        } else if (state is FetchPopularRecipeFailure) {
          return Text(state.errorMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
