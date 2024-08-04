import 'dart:convert';

import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle_location.dart';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  String vehicleBrand;
  String vehicleColor;
  String vehiclePlate;
  String vehicleDriver;
  VehicleLocation start;
  String vehicleModel;
  VehicleLocation end;
  int status;
  VehicleLocation currentLocation;

  Vehicle({
    required this.vehicleBrand,
    required this.vehicleColor,
    required this.vehiclePlate,
    required this.vehicleDriver,
    required this.start,
    required this.vehicleModel,
    required this.end,
    required this.status,
    required this.currentLocation,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        vehicleBrand: json["vehicle_brand"],
        vehicleColor: json["vehicle_color"],
        vehiclePlate: json["vehicle_plate"],
        vehicleDriver: json["vehicle_driver"],
        start: VehicleLocation.fromJson(json["start"]),
        vehicleModel: json["vehicle_model"],
        end: VehicleLocation.fromJson(json["end"]),
        status: json["status"],
        currentLocation: VehicleLocation.fromJson(json["current_location"]),
      );

  Map<String, dynamic> toJson() => {
        "vehicle_brand": vehicleBrand,
        "vehicle_color": vehicleColor,
        "vehicle_plate": vehiclePlate,
        "vehicle_driver": vehicleDriver,
        "start": start.toJson(),
        "vehicle_model": vehicleModel,
        "end": end.toJson(),
        "status": status,
        "current_location": currentLocation.toJson(),
      };

  String description() {
    return "$vehicleBrand $vehicleModel\n$vehicleColor\n$vehicleDriver";
  }
}
