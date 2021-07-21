import 'package:flutter/material.dart';
import 'package:sport_app/config/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      canvasColor: AppColors.yellow,
      textTheme: TextTheme(
        headline2: GoogleFonts.muli(
            fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.blue),
        button: GoogleFonts.muli(
            fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white),
        bodyText1: TextStyle(
            color: AppColors.blue, fontFamily: "Avenir", fontSize: 19),
        bodyText2: TextStyle(
            color: AppColors.blue, fontFamily: "Avenir", fontSize: 17),
        headline1: GoogleFonts.muli(
            fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.blue),
      ),
      scaffoldBackgroundColor: AppColors.yellow,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.blue,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));
}
