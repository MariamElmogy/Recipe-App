import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * .05,
        vertical: SizeConfig.height * .01,
      ),
      child: GNav(
        gap: 10,
        tabBorderRadius: 100,
        backgroundColor: Colors.transparent,
        activeColor: Colors.white,
        color: const Color(0XFF97A2B0),
        tabBackgroundColor: const Color(0XFF70B9BE),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * .01,
          vertical: SizeConfig.height * .01,
        ),
        tabs: const [
          GButton(
            icon: Icons.house_rounded,
            text: "Home",
            iconSize: 20,
          ),
          GButton(
            icon: Icons.search_rounded,
            text: "Search",
            iconSize: 20,
          ),
          GButton(
            icon: Icons.favorite_border,
            text: "Favorites",
            iconSize: 20,
          ),
        ],
        onTabChange: widget.onTap,
        selectedIndex: 0,
      ),
    );
  }
}
