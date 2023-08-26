import 'package:flutter/material.dart';

class Globals {
  static double getDeviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getDeviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
