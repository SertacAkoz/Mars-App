import 'package:flutter/material.dart';
import 'package:mars_app/inheritance/mars_style.dart';

class ListStyle extends MarsStyle{
  double filterRowPadding(){
    return 75;
  }

  TextStyle rowTitleTextTyle(){
    return const TextStyle(fontWeight: FontWeight.bold);
  }

  TextStyle purchaseCostTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold);
  }
}