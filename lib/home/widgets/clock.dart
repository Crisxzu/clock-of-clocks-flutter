import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  Clock({
    super.key,
    this.firstNeedleTurns = 3/8,
    this.secondNeedleTurns = 3/8,
    this.needleTurns,
    this.duration = const Duration(milliseconds: 500)
  });

  double firstNeedleTurns;
  double secondNeedleTurns;
  List<double>? needleTurns;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    if(needleTurns != null) {
      if(needleTurns!.length != 2) {
        throw RangeError.range(needleTurns!.length, 2, 2);
      }

      firstNeedleTurns = needleTurns![0];
      secondNeedleTurns = needleTurns![1];
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 1, color: Color.fromRGBO(52, 52, 52, 1)),
          borderRadius: BorderRadius.circular(24)
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
  }
}
