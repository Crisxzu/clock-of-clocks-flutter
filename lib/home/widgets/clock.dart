import 'package:flutter/material.dart';
import '../../common/responsive_utils.dart';

class Clock extends StatelessWidget {
  Clock({
    super.key,
    double? firstNeedleTurns,
    double? secondNeedleTurns,
    this.needleTurns,
    this.duration = const Duration(milliseconds: 500)
  }) : firstNeedleTurns = needleTurns?[0] ?? firstNeedleTurns ?? 3/8,
       secondNeedleTurns = needleTurns?[1] ?? secondNeedleTurns ?? 3/8 {
    if(needleTurns != null && needleTurns!.length != 2) {
      throw RangeError.range(needleTurns!.length, 2, 2);
    }
  }

  final double firstNeedleTurns;
  final double secondNeedleTurns;
  final List<double>? needleTurns;
  final Duration duration;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableSize = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;
        double borderRadius = 24;
        final borderWidth = getResponsiveBorderWidth(availableSize);

        return Container(
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: borderWidth, color: Color.fromRGBO(52, 52, 52, 1)),
              borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: Stack(
            children: [
              SizedBox.expand(
                child: AnimatedRotation(
                  turns: firstNeedleTurns,
                  duration: duration,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.08,
                    alignment: FractionalOffset.centerRight,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.yellow
                        )
                    ),
                  ),
                ),
              ),
              SizedBox.expand(
                child: AnimatedRotation(
                  turns: secondNeedleTurns,
                  duration: duration,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.08,
                    alignment: FractionalOffset.centerRight,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.yellow
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
