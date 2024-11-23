import 'package:flutter/material.dart';
import 'package:recipe_app/screens/account/presentation/views/widgets/account_view_body.dart';
import 'package:recipe_app/screens/home/presentation/views/widgets/custom_title.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(title: "Account"),
        centerTitle: true,
      ),
      body: const SafeArea(
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: AccountViewBody(),
        ),
      ),
    );
  }
}
