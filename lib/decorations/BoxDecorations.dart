import 'package:blocking_tracks/resources/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class BoxDecorations {
  static double boderWidth = Adaptive.dp(1);
  static double radius = Adaptive.dp(12);

  static BoxDecoration defaultBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: CustomColors.greyColor,
        shape: BoxShape.rectangle);
  }

  static BoxDecoration greyBoxDecoration(double radius) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: CustomColors.greyColor,
        shape: BoxShape.rectangle);
  }

  static BoxDecoration blueBoxDecoration(double radius) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: CustomColors.blue,
        shape: BoxShape.rectangle);
  }

  static BoxDecoration selectedBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: CustomColors.greyLightColor,
        shape: BoxShape.rectangle);
  }

  static BoxDecoration dialogBackground() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.dp)),
        color: CustomColors.greyColor,
        shape: BoxShape.rectangle);
  }

}
