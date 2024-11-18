import 'package:flutter/material.dart';

class SizeConfig {
  static late double width, height;
  static init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
