import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/service_locator.dart';
import 'package:recipe_app/core/utils/size_config.dart';
import 'package:recipe_app/screens/home/data/models/recipe_model/recipe_database.dart';
import 'package:recipe_app/screens/onboarding/presentation/views/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // using getIt for dependency injection
  setUpServiceLocator();
  // initialize recipes database
  await RecipeDatabase.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize before using SizeConfig
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Sofia Pro"),
      home: const OnboardingView(),
    );
  }
}
