import 'package:clock_app/home/widgets/digit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock made of clock"),
        centerTitle: true,
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return FractionallySizedBox(
              widthFactor: orientation == Orientation.portrait ? 0.6 : 0.2,
              heightFactor: orientation == Orientation.portrait ? 0.5 : 1,
              alignment: FractionalOffset.center,
              child: Digit(value: 1),
            );
          },
        ),
      ),
    );
  }
}
