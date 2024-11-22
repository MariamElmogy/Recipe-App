import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/custom/custom_text_form_field.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/category_tab_bar.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';
import 'package:recipe_app/screens/search/presentation/manager/fetch_popular_recipe_cubit/fetch_popular_recipe_cubit.dart';
import 'package:recipe_app/screens/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:recipe_app/screens/search/presentation/views/widgets/fetch_popular_recipe_bloc_builder.dart';
import 'package:recipe_app/screens/search/presentation/views/widgets/search_result_recipe_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String selectedCategory = "Breakfast";
  String searchQuery = "";
  @override
  void initState() {
    BlocProvider.of<FetchPopularRecipeCubit>(context)
        .fetchPopularRecipes(meal: selectedCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomTextFormField(onChanged: onSearch),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: SizeConfig.height * .03,
          ),
        ),
        searchQuery.isNotEmpty
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: SizeConfig.height,
                  child: const SearchResultRecipeBlocBuilder(),
                ),
              )
            : SliverToBoxAdapter(
                child: CategoryTabBar(
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                      BlocProvider.of<FetchPopularRecipeCubit>(context)
                          .fetchPopularRecipes(meal: selectedCategory);
                    });
                  },
                ),
              ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * .03,
              vertical: SizeConfig.height * .03,
            ),
            child: const CustomTitle(title: "Popular Recipes"),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: SizeConfig.height,
            child: FetchPopularRecipeBlocBuilder(category: selectedCategory),
          ),
        ),
      ],
    );
  }

  void onSearch(String query) {
    setState(() {
      searchQuery = query;
      BlocProvider.of<SearchRecipeCubit>(context)
          .searchRecipes(food: searchQuery);
    });
  }
}
