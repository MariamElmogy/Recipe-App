import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo_implement.dart';
import 'package:recipe_app/screens/home/presentation/manager/toggle_favorite_recipe_cubit/toggle_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/manager/fetch_recipe_cubit/fetch_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchRecipeCubit(getIt.get<RecipeRepoImplement>()),
        ),
        BlocProvider(
          create: (context) =>
              ToggleFavoriteRecipeCubit(getIt.get<RecipeRepoImplement>()),
        ),
      ],
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
