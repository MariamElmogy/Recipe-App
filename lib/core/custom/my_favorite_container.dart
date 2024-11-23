import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class MyFavoriteContainer extends StatelessWidget {
  const MyFavoriteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * .07,
      height: SizeConfig.height * .04,
      decoration: BoxDecoration(
        color: const Color(0XFFFFFFFF).withOpacity(.8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Icon(
        Icons.favorite_outline,
        color: Colors.black,
        size: 16,
      ),
    );
  }
}
