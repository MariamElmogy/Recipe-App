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
        horizontal: SizeConfig.width * .015,
        vertical: SizeConfig.height * .01,
      ),
      child: GNav(
        gap: 10,
        tabBorderRadius: 100,
        backgroundColor: Colors.grey[100]!,
        activeColor: Colors.white,
        color: Colors.blue[600],
        tabBackgroundGradient: LinearGradient(colors: [
          Colors.blue[400]!,
          Colors.blueAccent.shade700,
        ], begin: Alignment.topLeft, end: Alignment.topRight),
        iconSize: 30,
        textSize: 18,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * .01,
            vertical: SizeConfig.height * .01),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.person,
            text: "Person",
          ),
        ],
        onTabChange: widget.onTap,
        selectedIndex: 0,
      ),
    );
  }
}
