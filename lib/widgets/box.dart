// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final BoxSize size;
  final BoxType type;
  const Box({
    super.key,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BoxType.VERTICAL:
        switch (size) {
          case BoxSize.SMALL:
            return const SizedBox(height: 10);
          case BoxSize.MEDIUM:
            return const SizedBox(height: 20);
          case BoxSize.BIG:
            return const SizedBox(height: 30);
          default:
            return const SizedBox(height: 10);
        }
      default: // HORIZONTAL
        switch (size) {
          case BoxSize.SMALL:
            return const SizedBox(width: 10);
          case BoxSize.MEDIUM:
            return const SizedBox(width: 20);
          case BoxSize.BIG:
            return const SizedBox(width: 30);
          default:
            return const SizedBox(width: 10);
        }
    }
  }
}

enum BoxSize{
  SMALL,
  MEDIUM,
  BIG,
}

enum BoxType{
  VERTICAL,
  HORIZONTAL,
}