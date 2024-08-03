import 'package:awr_vehicle_tracker/custom_views/vehicle_plate.dart';
import 'package:awr_vehicle_tracker/extensions/view_extensions.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/screen/children/vehicle_status.dart';
import 'package:flutter/material.dart';

class VehicleListItem extends StatelessWidget {
  const VehicleListItem({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
    elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VehiclePlate(vehiclePlate: vehicle.vehiclePlate),
                            const SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('${vehicle.vehicleBrand} ${vehicle.vehicleModel}',
                              style: vehicleBrandTextStyle),
                            )
                          ],
                        ),
                        const Spacer(),
                        VehicleStatus(status: vehicle.status)
          ],
        ),
      ),
    );
  }
}