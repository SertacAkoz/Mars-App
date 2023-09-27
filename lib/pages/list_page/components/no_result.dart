import 'package:flutter/material.dart';

import 'package:mars_app/pages/list_page/list_style.dart';
import 'package:mars_app/widgets/box.dart';

class NoResultView extends StatelessWidget {
  final ListStyle style;
  final Function() onPressed;
  const NoResultView({
    Key? key,
    required this.style,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: style.primaryColor(),
                  size: 45,
                )
              ],
            ),
            const Box(size: BoxSize.MEDIUM, type: BoxType.VERTICAL),
            const Text(
              'No products were found matching your search criteria. Please refresh the page to see all products.',
              textAlign: TextAlign.center,
            ),
            const Box(size: BoxSize.MEDIUM, type: BoxType.VERTICAL),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: style.primaryColor()),
              onPressed: () {
                onPressed();
                // _viewModel.getAllDatas();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Refresh'),
                  Box(size: BoxSize.MEDIUM, type: BoxType.VERTICAL),
                  Icon(Icons.refresh_rounded),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
