import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key, required this.image, this.width, this.height});

  final String? image;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.width,
      height: height ?? SizeConfig.height * .14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: image != null
            ? DecorationImage(
                image: NetworkImage(image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
