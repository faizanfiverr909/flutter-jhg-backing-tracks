import 'package:blocking_tracks/resources/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static final whiteSmallTextStyle = TextStyle(
      color: CustomColors.whiteColor,
      fontSize: Adaptive.sp(10.0),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily);

  static final whiteMediumTextStyle = TextStyle(
      color: CustomColors.whiteColor,
      fontSize: Adaptive.sp(12.0),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily);

  static final white40TextStyle = TextStyle(
      color: CustomColors.whiteColor,
      fontSize: Adaptive.sp(35.0),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily);

  static final white14TextStyle = TextStyle(
      color: CustomColors.whiteColor,
      fontSize: Adaptive.sp(18.0),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily);

  static   whiteTextStyle(int size) => TextStyle(
      color: CustomColors.whiteColor,
      fontSize: Adaptive.sp(size),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,);

  static   whiteTextStyleBold(int size) => TextStyle(
    color: CustomColors.whiteColor,
    fontSize: Adaptive.sp(size),
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily, fontWeight: FontWeight.bold);
}
