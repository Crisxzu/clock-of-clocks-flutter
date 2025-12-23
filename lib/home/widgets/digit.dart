import 'dart:math';

import 'package:flutter/material.dart';

import '../../common/utils.dart';
import 'clock.dart';

class Digit extends StatelessWidget {
  Digit({
    super.key,
    required this.value,
    required this.orientation,
  });

  int value;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    value = min(9, max(0, value));
    final angles = getAngleFromDigit(value);

    return GridView.count(
      primary: false,
      crossAxisCount: 4,
      crossAxisSpacing: orientation == Orientation.portrait ? 0 : 3,
      mainAxisSpacing: orientation == Orientation.portrait ? 0 : 3,
      children: [
        ...[
          for(int i = 0; i < angles!.length; i++)
            Clock(needleTurns: angles[i],)
        ]
      ],
    );
  }
}
