import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/custom/custom_elevated_button.dart';
import 'package:recipe_app/core/utils/app_font_styles.dart';
import 'package:recipe_app/core/utils/images_data.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/presentation/views/home_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height,
      width: SizeConfig.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              ImagesData.pattern,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.height * .25,
            child: Text(
              "Help your path to health\n goals with happiness",
              style: AppFontStyles.styleBold30(context),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: SizeConfig.width,
              height: SizeConfig.height * .2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    r"Let's Cook Good Food",
                    style: AppFontStyles.styleSemiBold26(context),
                  ),
                  SizedBox(height: SizeConfig.height * .01),
                  CustomElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                      (route) => false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
