import 'package:flutter/material.dart';

/// Returns true if the device is a tablet (shortest side >= 600dp)
bool isTablet(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide >= 600;
}

/// Returns a responsive font size based on screen width
double getResponsiveFontSize(BuildContext context, {double mobileFactor = 0.04, double tabletFactor = 0.025}) {
  final width = MediaQuery.of(context).size.width;
  final factor = isTablet(context) ? tabletFactor : mobileFactor;
  return width * factor;
}

/// Returns responsive spacing based on screen width
double getResponsiveSpacing(BuildContext context, {double mobileFactor = 0.025, double tabletFactor = 0.015}) {
  final width = MediaQuery.of(context).size.width;
  final factor = isTablet(context) ? tabletFactor : mobileFactor;
  return width * factor;
}

/// Returns responsive padding based on screen width
double getResponsivePadding(BuildContext context, {double mobileFactor = 0.02, double tabletFactor = 0.015}) {
  final width = MediaQuery.of(context).size.width;
  final factor = isTablet(context) ? tabletFactor : mobileFactor;
  return width * factor;
}

/// Returns responsive border width based on available size
double getResponsiveBorderWidth(double availableSize, {double factor = 0.003}) {
  return (availableSize * factor).clamp(1.0, 3.0);
}