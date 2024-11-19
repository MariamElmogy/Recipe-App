import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/category_tab_bar.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/feature_item.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/fetch_popular_list_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String selectedCategory = "Breakfast";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: CustomAppBar(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * .03,
                vertical: SizeConfig.height * .03),
            child: const CustomTitle(title: r"Let's enjoy cooking!"),
          ),
        ),
        const SliverToBoxAdapter(
          child: FeatureItem(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * .03,
                vertical: SizeConfig.height * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTitle(title: "Category"),
                Text(
                  "See all",
                  style: AppFontStyles.styleRegular16(context).copyWith(
                    color: const Color(0XFF70B9BE),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CategoryTabBar(
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.height * .02),
        ),
        SliverToBoxAdapter(
          child: FetchPopularListViewBlocBuilder(category: selectedCategory),
        ),
      ],
    );
  }
}
