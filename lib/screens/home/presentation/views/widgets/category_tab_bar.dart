import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/tab_item.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key, required this.onCategorySelected});
  final Function(String) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: const Color(0XFFF1F5F5),
        height: SizeConfig.height * .05,
        child: TabBar(
          unselectedLabelColor: const Color(0XFF0A2533),
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: const Color(0XFF70B9BE),
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: (index) {
            const categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];
            onCategorySelected(categories[index]);
          },
          labelPadding:
              EdgeInsets.symmetric(horizontal: SizeConfig.width * .012),
          tabs: const [
            TabItem(title: "Breakfast"),
            TabItem(title: "Lunch"),
            TabItem(title: "Dinner"),
            TabItem(title: "Snacks"),
          ],
        ),
      ),
    );
  }
}
