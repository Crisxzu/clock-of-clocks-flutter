import 'dart:math';

import 'package:clock_app/home/widgets/clock.dart';
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
        child: Clock(firstNeedleAngle: 0, secondNeedleAngle: pi),
      ),
    );
  }
}
