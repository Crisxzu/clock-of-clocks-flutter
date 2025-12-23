import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

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

String getHour(DateTime dateTime, Locale locale, {bool is24HourFormat = true}) {
  final formatter = DateFormat(is24HourFormat ? 'Hms' : 'jms', locale.toString());
  return formatter.format(dateTime);
}

/// Detects if the locale uses 24-hour format
/// Works correctly on web and mobile by testing the actual formatted time
bool is24HourFormat(BuildContext context) {
  // Try MediaQuery first (works on mobile)
  final mediaQuery24h = MediaQuery.of(context).alwaysUse24HourFormat;

  // On web, MediaQuery always returns false, so we need to detect from the locale
  // Format a test time and check if it contains AM/PM
  final locale = Localizations.localeOf(context);
  final testTime = DateTime(2000, 1, 1, 14, 0); // 2:00 PM
  final formatter = DateFormat.jm(locale.toString());
  final formatted = formatter.format(testTime);

  // If the formatted time contains AM or PM, it's 12-hour format
  final is12Hour = formatted.toUpperCase().contains('AM') ||
                   formatted.toUpperCase().contains('PM');

  // Return true if MediaQuery says 24h OR if formatted time doesn't contain AM/PM
  return mediaQuery24h || !is12Hour;
}