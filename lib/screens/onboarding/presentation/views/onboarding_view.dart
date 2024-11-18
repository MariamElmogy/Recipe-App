import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_colors.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: OnboardingViewBody(),
    );
  }
}
