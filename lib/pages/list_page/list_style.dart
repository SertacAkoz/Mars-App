import 'package:flutter/material.dart';
import 'package:mars_app/inheritance/mars_style.dart';

class ListStyle extends MarsStyle{
  double filterRowPadding(){
    return 75;
  }

  double filterWhitespaceHeight(){
    return 20;
  }

  double errorWhitespaceHeight(){
    return 20;
  }

  TextStyle rowTitleTextTyle(){
    return const TextStyle(fontWeight: FontWeight.bold);
  }

  TextStyle purchaseCostTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold);
  }
}