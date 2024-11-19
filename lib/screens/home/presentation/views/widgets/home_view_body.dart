import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/category_tab_bar.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/feature_item.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/popular_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        const SliverToBoxAdapter(
          child: CategoryTabBar(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: SizeConfig.height * .02),
        ),
        const SliverToBoxAdapter(
          child: PopularListView(),
        ),
      ],
    );
  }
}
