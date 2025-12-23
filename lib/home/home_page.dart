import 'dart:math';

import 'package:clock_app/common/utils.dart';
import 'package:clock_app/home/widgets/clock.dart';
import 'package:clock_app/home/widgets/digit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final oneDigit = getAngleFromDigit(4);

    return Scaffold(
      appBar: AppBar(
        title: Text("Clock made of clock"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 500,
          child: Digit(value: 1),
        ),
      ),
    );
  }
}
