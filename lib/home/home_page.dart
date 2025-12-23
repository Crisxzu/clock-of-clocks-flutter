import 'dart:async';


import 'package:flutter/material.dart';

import '../common/utils.dart';
import '../common/responsive_utils.dart';
import '../l10n/app_localizations.dart';
import 'widgets/digit.dart';
import 'widgets/credits.dart';


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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      is24HFormat = is24HourFormat(context);
      _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
        updateHour();
      });
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Material(
          color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          child: Credits(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: OrientationBuilder(
            builder: (context, orientation) {
              final spacing = getResponsiveSpacing(context);
              final tablet = isTablet(context);

              return FractionallySizedBox(
                widthFactor: orientation == Orientation.portrait ? 0.9 : (tablet ? 0.6 : 0.75),
                heightFactor: orientation == Orientation.portrait ? (tablet ? 0.25 : 0.25) : 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Row(
                        spacing: spacing,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        is24HFormat ? l10n.format24Hours : "${l10n.format12Hours} ($symbol)",
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context)
                        ),
                      ),
                    ),
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
