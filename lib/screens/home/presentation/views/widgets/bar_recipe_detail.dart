import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/selected_item.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/unselected_item.dart';

class BarRecipeDetail extends StatelessWidget {
  const BarRecipeDetail(
      {super.key, required this.isSelected, required this.text});
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return isSelected ? SelectedItem(text: text) : UnselectedItem(text: text);
  }
}
