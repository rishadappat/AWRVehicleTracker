import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class VehicleStatus extends StatelessWidget {
  const VehicleStatus({super.key, required this.status});

  final int status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: statusColor(),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
                child: Text(statusText(), style: const TextStyle(color: Colors.white),),
              ),);
  }

  Color statusColor() {
    switch (status) {
      case 0:
        return AppColors.statusHault;
      case 1:
        return AppColors.statusTransit;
      case 2:
        return AppColors.statusReached;
      default:
      return AppColors.darkGrey;
    }
  }

  String statusText() {
    switch (status) {
      case 0:
        return 'Halted';
      case 1:
        return 'In Transit';
      case 2:
        return 'Reached';
      default:
      return 'Unknown';
    }
  }
}