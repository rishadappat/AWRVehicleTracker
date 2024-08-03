import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LiveVehicleViewScreen extends ConsumerStatefulWidget {
  static const String routeName = '/liveVehicleViewScreen';
  const LiveVehicleViewScreen(this.vehicle, {super.key});

  final String vehicle;

  @override
  ConsumerState<LiveVehicleViewScreen> createState() => _LiveVehicleViewScreenState();
}

class _LiveVehicleViewScreenState extends ConsumerState<LiveVehicleViewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}