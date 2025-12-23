import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({
    super.key,
    this.firstNeedleTurns = 0,
    this.secondNeedleTurns = 0,
    this.duration = const Duration(seconds: 1)
  });

  final double firstNeedleTurns;
  final double secondNeedleTurns;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 5, color: Colors.grey)
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
