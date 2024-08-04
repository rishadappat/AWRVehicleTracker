import 'package:awr_vehicle_tracker/features/live_vehicle_view/domain/providers/directions_provider.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/providers/state/directions_notifier.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/providers/state/directions_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final directionsNotifierProvider =
    StateNotifierProvider<DirectionsNotifier, DirectionsState>((ref) {
  final repository = ref.watch(directionsRepositoryProvider);
  return DirectionsNotifier(repository)..getDirections([]);
});
