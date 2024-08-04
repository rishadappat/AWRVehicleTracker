import 'package:awr_vehicle_tracker/features/vehicle_list/data/model/vehicle.dart';
import 'package:awr_vehicle_tracker/shared/theme/test_styles.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.vehicle.vehicleDriver,
                    style: AppTextStyles.h2,
                  ),
                  const Text(
                    "0508559812",
                    style: AppTextStyles.body,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
