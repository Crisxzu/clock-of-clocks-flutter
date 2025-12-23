import 'dart:async';

import 'package:clock_app/common/utils.dart';
import 'package:clock_app/common/responsive_utils.dart';
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
    bool is24HFormat = is24HourFormat(context);
    String hourStr = getHour(nowDate, getUserLanguage(context), is24HourFormat: is24HFormat);

    if(!is24HFormat) {
      final temp = hourStr.substring(0, hourStr.length - 3);
      symbol = hourStr.substring(temp.length+1);
      hourStr = temp;
    }

    setState(() {
      parts = hourStr.split(':').map((part) => part.padLeft(2, '0')).toList();
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
      body: SafeArea(
        child: Center(
          child: OrientationBuilder(
            builder: (context, orientation) {
              final spacing = getResponsiveSpacing(context);
              final tablet = isTablet(context);

              return FractionallySizedBox(
                widthFactor: orientation == Orientation.portrait ? 0.9 : (tablet ? 0.6 : 0.75),
                heightFactor: orientation == Orientation.portrait ? (tablet ? 0.25 : 0.2) : 0.85,
                child: Column(
                  children: [
                    Flexible(
                      child: Row(
                        spacing: spacing,
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
                      padding: EdgeInsets.all(getResponsivePadding(context)),
                      child: Text(
                        is24HFormat ? "24 hours format" : "12 hours format($symbol)",
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context)
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
