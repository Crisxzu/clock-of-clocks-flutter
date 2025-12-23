import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({
    super.key,
    this.firstNeedleAngle = 0,
    this.secondNeedleAngle = 0
  });

  final double firstNeedleAngle;
  final double secondNeedleAngle;

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
            child: Transform.rotate(
              angle: firstNeedleAngle,
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
            child: Transform.rotate(
              angle: secondNeedleAngle,
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
