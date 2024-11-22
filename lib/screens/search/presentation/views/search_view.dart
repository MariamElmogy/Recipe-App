import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';
import 'package:recipe_app/screens/search/data/repo/search_repo_implement.dart';
import 'package:recipe_app/screens/search/presentation/manager/fetch_popular_recipe_cubit/fetch_popular_recipe_cubit.dart';
import 'package:recipe_app/screens/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:recipe_app/screens/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchPopularRecipeCubit(getIt.get<SearchRepoImplement>()),
        ),
        BlocProvider(
          create: (context) =>
              SearchRecipeCubit(getIt.get<SearchRepoImplement>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const CustomTitle(title: "Search"),
          centerTitle: true,
        ),
        body: const SafeArea(
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.all(16),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
