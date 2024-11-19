import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/screens/onboarding/presentation/views/onboarding_view.dart';

void main() {
  // This is the main entry point of your application.
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Sofia Pro"),
      home: const OnboardingView(),
    );
  }
}
