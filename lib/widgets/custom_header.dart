// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mars_app/widgets/drawer.dart';


class CustomHeaderWidget extends StatelessWidget {
  String title;
  TextStyle textstyle;
  Color backgroundColor;
  CustomHeaderWidget({
    Key? key,
    required this.title,
    required this.textstyle,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              onPressed: () {
                AppDrawer.of(context)?.toggle();
              },
              icon: Icon(
                Icons.menu,
                size: 35,
                color: backgroundColor,
              ),
            ),
          ),
          Text(
            title,
            style: textstyle,
          ),
        ],
      ),
    );
  }
}
