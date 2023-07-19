import 'package:flutter/material.dart';

import 'colors_manager.dart';

class StyleManager{
   static const TextStyle title =  TextStyle(
    fontSize: 95,
    fontWeight: FontWeight.bold,
     color: Colors.white,

  );
  static const TextStyle subtitle =  TextStyle(
    fontSize: 70,
    fontWeight: FontWeight.bold,
     color: Colors.white,
   );

  static const TextStyle normal =  TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
     color:  ColorsManager.buttonColor,
    fontFamily: 'Title'
   );
}