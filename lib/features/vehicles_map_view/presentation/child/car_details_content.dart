import 'package:auto_route/auto_route.dart';
import 'package:awr_vehicle_tracker/custom_views/action_button.dart';
import 'package:awr_vehicle_tracker/custom_views/vehicle_plate.dart';
import 'package:awr_vehicle_tracker/extensions/view_extensions.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/features/vehicles_map_view/presentation/child/profile_view.dart';
import 'package:awr_vehicle_tracker/routes/app_router.dart';
import 'package:awr_vehicle_tracker/shared/theme/app_colors.dart';
import 'package:awr_vehicle_tracker/shared/theme/test_styles.dart';
import 'package:flutter/material.dart';

class CarDetailsContent extends StatefulWidget {
  const CarDetailsContent({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  State<CarDetailsContent> createState() => _CarDetailsContentState();
}

class _CarDetailsContentState extends State<CarDetailsContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 40, 12, 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Colors.white.withAlpha(200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Vehicle Details',
                  style: AppTextStyles.h4,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VehiclePlate(vehiclePlate: widget.vehicle.vehiclePlate),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.vehicle.vehicleBrand,
                            style: vehicleBrandTextStyle),
                        Text(widget.vehicle.vehicleModel,
                            style: secondaryVehicleBrandTextStyle)
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Driver Details',
                  style: AppTextStyles.h4,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                ProfileView(vehicle: widget.vehicle),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ActionButton(
                        text: "Call",
                        icon: Icons.call,
                        onPressed: () {},
                        backgroundColor: Colors.blue),
                    const SizedBox(width: 20),
                    ActionButton(
                        text: "Message",
                        icon: Icons.message,
                        onPressed: () {},
                        backgroundColor: Colors.green)
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    iconAlignment: IconAlignment.end,
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      LiveVehicleViewRoute route =
                          LiveVehicleViewRoute(vehicle: widget.vehicle);
                      AutoRouter.of(context).push(
                        route,
                      );
                    },
                    label: const Text(
                      "Show Details",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.drag_handle_outlined,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
