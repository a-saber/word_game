import 'package:flutter/material.dart';

class ColorsManager{
  // static Color? primaryColor = Colors.cyan[100];
  static Color? primaryColor = Color.fromARGB(255, 250, 208, 233);
  static Color? alertBack = buttonColor.withOpacity(0.5);
  static const Color buttonColor =  Color.fromARGB(252, 108, 113, 220);
  static const Color textInStarTitle =  Color.fromARGB(252, 108, 113, 220);
  static const Color iconColor =  Colors.white;
  static const Color secondColor = Colors.white;
  static const Color wrongAnswerColor = Colors.red;
  static const  Color wrightAnswerColor = Colors.green;
  static const Color defaultAnswerColor =  Color.fromARGB(252, 108, 113, 220);
  static const Color textAnswerColor = Colors.amber;
  static const Color sampleBackgroundColor =  Color.fromARGB(252, 243, 243, 248);
  static const Color sampleSquareColor = Colors.grey;
  static const  Color emptyAnswerColor = secondColor;
  static   Color? fullAnswerColor = Colors.amber;
  static const  Color fullAnswerTextColor = secondColor;
  static   Color? buttonBackgroundColor = primaryColor;
  static const  Color buttonIconColor = secondColor;
  static const  Color unChosenSampleColor = Color.fromARGB(252, 108, 113, 220);
  static const  Color chosenSampleColor = sampleBackgroundColor;
  static const  Color unChosenSampleTextColor = secondColor;
  static const  Color unOpenedGroup = Colors.grey;

}