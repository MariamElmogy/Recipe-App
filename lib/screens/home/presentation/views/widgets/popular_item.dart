import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/images_data.dart';
import 'package:recipe_app/core/utils/size_config.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * .4,
      margin: EdgeInsets.only(
          right: SizeConfig.width * .04,
          top: SizeConfig.height * .005,
          bottom: SizeConfig.height * .005,
          left: SizeConfig.width * .02),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 10),
            color: const Color(0xFF063336).withOpacity(.10),
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: SizeConfig.width,
                height: SizeConfig.height * .14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(ImagesData.food),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.height * .012),
              Text(
                "Healthy Taco Salad with fresh vegetable",
                style: AppFontStyles.styleBold16(context)
                    .copyWith(color: AppColors.titleColor),
              ),
              SizedBox(height: SizeConfig.height * .009),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.fastfood_outlined,
                    color: Color(0XFF97A2B0),
                    size: 14,
                  ),
                  Text("120 Kcal",
                      style: AppFontStyles.styleRegular14(context)),
                  Text(".", style: AppFontStyles.styleRegular14(context)),
                  const Icon(
                    Icons.timer_outlined,
                    color: Color(0XFF97A2B0),
                    size: 14,
                  ),
                  Text("20 Min", style: AppFontStyles.styleRegular14(context)),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
