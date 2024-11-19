import 'package:flutter/material.dart';
import 'package:recipe_app/core/custom/bottom_navigation_bar.dart';
import 'package:recipe_app/screens/home/presentation/views/home_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  void dispose() {
    pageController
        .dispose(); // Disposing of the PageController when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTap: (page) {
          pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
          setState(() {
            currentPage = page;
          });
        },
        selectedIndex: currentPage,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          currentPage = page;
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          Center(
            child: Text("Page 2"),
          ),
        ],
      ),
    );
  }
}
