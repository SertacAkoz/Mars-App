import 'package:flutter/material.dart';

abstract class MarsStyle{
  
  Color primaryColor(){
    return const Color(0xFF432BFF);
  }
  double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  TextStyle headerTextStyle(){
    return TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: primaryColor());
  }

  EdgeInsets headerPadding(){
    return const EdgeInsets.fromLTRB(0.0, 63.0, 0.0, 0.0);
  }
}