import 'dart:async';

import 'package:clock_app/common/utils.dart';
import 'package:clock_app/home/widgets/digit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> parts = [];
  Timer? _timer;
  bool is24HFormat = true;
  String symbol = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    is24HFormat = is24HourFormat(context);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      updateHour();
    });
  }

  void updateHour() {
    final nowDate = DateTime.now();
    String hourStr = getHour(nowDate, getUserLanguage(context));
    bool is24HFormat = is24HourFormat(context);

    if(!is24HFormat) {
      final temp = hourStr.substring(0, hourStr.length - 3);
      symbol = hourStr.substring(temp.length+1);
    }

    setState(() {
      parts = hourStr.split(':');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              widthFactor: orientation == Orientation.portrait ? 0.9 : 0.75,
              heightFactor: orientation == Orientation.portrait ? 0.2 : 0.85,
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      spacing: orientation == Orientation.portrait ? 10 : 20,
                      children: [
                        ...[
                          for(int i = 0; i < parts.length; i++)
                            Flexible(
                              child: Row(
                              children: [
                                  Flexible(
                                    child: Digit(
                                      value: int.parse(parts[i][0]),
                                      orientation: orientation,
                                    )
                                  ),
                                  Flexible(
                                    child: Digit(
                                      value: int.parse(parts[i][1]),
                                      orientation: orientation,
                                    )
                                  )
                                ],
                              ),
                            )
                        ]
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      is24HFormat ? "24 hours format" : "12 hours format($symbol)",
                      style: TextStyle(
                        fontSize: 24
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
