import 'package:clock_app/common/constants.dart';

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