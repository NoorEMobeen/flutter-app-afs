import 'package:flutter/material.dart';

class CustomTheme {
  late final Gradient? gradient;
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      //2
      primaryColor: Colors.orange[200],
      scaffoldBackgroundColor: Colors.white,

      fontFamily: 'Raleway', //3
      buttonTheme: ButtonThemeData(
        //buttonColor: const LinearGradient(colors: <Color>[]),
        // 4
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          //  LinearGradient(
          //     colors: <Color>[Colors.orange, Colors.pinkAccent]),
        ),
      ),
      //  buttonColor: const LinearGradient(colors: <Color>[Colors.orange, Colors.pinkAccent],
      // ),
    );
  }
}
