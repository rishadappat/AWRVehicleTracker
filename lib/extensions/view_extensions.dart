import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Shapes {
  static ShapeBorder defaultRoundedCorner = const RoundedRectangleBorder(borderRadius: 
  BorderRadius.all(Radius.circular(10)),
  side: BorderSide(
      color: Colors.black,
      width: 2,
    ));
}

TextStyle mainPlateTextStyle = const TextStyle(fontSize: 35, fontWeight: FontWeight.bold);
TextStyle secondaryPlateTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
TextStyle vehicleBrandTextStyle = const TextStyle(fontSize: 20, color: AppColors.darkGrey, fontWeight: FontWeight.bold);