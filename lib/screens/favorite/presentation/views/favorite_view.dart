import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/screens/favorite/data/repo/favorite_repo_implement.dart';
import 'package:recipe_app/screens/favorite/presentation/manager/cubit/fetch_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/favorite/presentation/views/widgets/favorite_view_body.dart';
import 'package:recipe_app/screens/home/data/repo/recipe_repo_implement.dart';
import 'package:recipe_app/screens/home/presentation/manager/toggle_favorite_recipe_cubit/toggle_favorite_recipe_cubit.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchFavoriteRecipeCubit(getIt.get<FavoriteRepoImplement>())
                ..fetchRecipe(),
        ),
        BlocProvider(
          create: (context) =>
              ToggleFavoriteRecipeCubit(getIt.get<RecipeRepoImplement>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const CustomTitle(title: "My Favorite"),
          centerTitle: true,
        ),
        body: const SafeArea(
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.all(16),
          child: AccountViewBody(),
        ),
      ),
    );
  }
}
