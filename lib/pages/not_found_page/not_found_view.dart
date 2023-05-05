// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:mars_app/pages/not_found_page/not_found_style.dart';
import 'package:mars_app/utils/utils.dart';

class NotFoundView extends StatelessWidget {
  NotFoundStyle style;
  NotFoundView({
    Key? key,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The page you were looking for was not found!'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Utils.navigate(navigationPath: '/assetList', context: context);
                },
                child: const Text('Go to home page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
