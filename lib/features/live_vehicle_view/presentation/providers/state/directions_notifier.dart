import 'package:awr_vehicle_tracker/features/live_vehicle_view/domain/repository/directions_repository.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/presentation/providers/state/directions_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:state_notifier/state_notifier.dart';

class DirectionsNotifier extends StateNotifier<DirectionsState> {
  final DirectionsRepository directionsRepository;

  bool get isFetching => state.state == DirectionsConcreteState.loading;

  DirectionsNotifier(
    this.directionsRepository,
  ) : super(const DirectionsState.initial());

  Future<void> getDirections(List<LatLng> points) async {
    if (isFetching &&
        state.state != DirectionsConcreteState.fetchedDirections) {
      state = state.copyWith(
        state: DirectionsConcreteState.loading,
        isLoading: true,
      );
    }
    if (points.isNotEmpty) {
      try {
        final response =
            await directionsRepository.getDirections(points: points);
        updateStateFromResponse(response);
      } catch (e) {
        e.toString();
        state = state.copyWith(
            directions: [],
            state: DirectionsConcreteState.failure,
            isLoading: false);
      }
    } else {
      state = state.copyWith(
          directions: [],
          state: DirectionsConcreteState.failure,
          isLoading: false);
    }
  }

  void updateStateFromResponse(List<ORSCoordinate> response) {
    state = state.copyWith(
        directions: response,
        state: DirectionsConcreteState.fetchedDirections,
        isLoading: false);
  }

  void resetState() {
    state = const DirectionsState.initial();
  }
}
