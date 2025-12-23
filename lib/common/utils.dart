import 'dart:ui';

import 'package:clock_app/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

List<List<double>>? getAngleFromDigit(int digit) {
 List<String>? positions = digitMap[digit.toString()];

 if(positions == null) {
   return null;
 }

 List<List<double>> angles = [];

 for(int i = 0; i < positions.length; i++) {
   String position = positions[i];

   angles.add(angleMap[position]!);
 }

 return angles;
}

Locale getUserLanguage(BuildContext context) {
  return Localizations.localeOf(context);
}

String getHour(DateTime dateTime, Locale locale) {
  final formatter = DateFormat('jms', locale.toString());
  return formatter.format(dateTime);
}

bool is24HourFormat(BuildContext context) {
  return MediaQuery.of(context).alwaysUse24HourFormat;
}