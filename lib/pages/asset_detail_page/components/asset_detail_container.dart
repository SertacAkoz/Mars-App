import 'package:flutter/material.dart';

import 'package:mars_app/pages/asset_detail_page/asset_detail_style.dart';

class AssetDetailContainer extends StatelessWidget {
  final String title;
  final String value;
  final AssetDetailStyle style;
  const AssetDetailContainer({
    Key? key,
    required this.title,
    required this.value,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: style.primaryColor().withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Divider(color: Colors.black),
            Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
