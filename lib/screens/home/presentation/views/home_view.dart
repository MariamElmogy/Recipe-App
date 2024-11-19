import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo_implement.dart';
import 'package:recipe_app/screens/home/presentation/manager/cubit/fetch_popular_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchPopularRecipeCubit(getIt.get<RecipeRepoImplement>())..fetchPopularRecipe(),
      child: const Scaffold(
        body: SafeArea(
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.all(8),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
