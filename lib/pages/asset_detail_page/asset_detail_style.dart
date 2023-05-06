import 'package:flutter/material.dart';
import 'package:mars_app/inheritance/mars_style.dart';

class AssetDetailStyle extends MarsStyle{
  TextStyle titleTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  }

  TextStyle subTitleTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  }

  TextStyle ageTextStyle(){
    return const TextStyle(fontStyle: FontStyle.italic);
  }

  TextStyle purchaseCostTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold);
  }

  TextStyle customFieldTitleTextStyle(){
    return const TextStyle(fontWeight: FontWeight.bold);
  }
}