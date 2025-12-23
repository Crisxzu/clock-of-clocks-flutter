import 'dart:math';

import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../common/responsive_utils.dart';
import 'clock.dart';

class Digit extends StatelessWidget {
  const Digit({
    super.key,
    required this.value,
    required this.orientation,
  });

  final int value;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    final clampedValue = min(9, max(0, value));
    final angles = getAngleFromDigit(clampedValue);
    final spacing = getResponsiveSpacing(context, mobileFactor: 0.005, tabletFactor: 0.003);

    return GridView.count(
      primary: false,
      crossAxisCount: 4,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      children: [
        ...[
          for(int i = 0; i < angles!.length; i++)
            Clock(needleTurns: angles[i],)
        ]
      ],
    );
  }
}
