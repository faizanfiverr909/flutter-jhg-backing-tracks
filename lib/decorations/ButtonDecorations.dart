
import 'package:blocking_tracks/resources/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class ButtonDecorations{
  static BoxDecoration saveButton() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.dp)),
        color: CustomColors.greyColor,
        shape: BoxShape.rectangle,
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffFE5D43),
            Color(0xffFE6E58),
          ],
        ));
  }

  static BoxDecoration defaultStrokeButton() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.dp)),
        color: CustomColors.greyColor,
        shape: BoxShape.rectangle,
    border: Border.all(color: CustomColors.greyLightColor,width: 1.dp));
  }

  static BoxDecoration buttonSelected() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.dp)),
        color: CustomColors.greyLightColor,
        shape: BoxShape.rectangle,
        border: Border.all(color: CustomColors.greyLightColor,width: 1.dp));
  }
}