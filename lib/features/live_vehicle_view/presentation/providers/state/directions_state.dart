import 'package:equatable/equatable.dart';
import 'package:open_route_service/open_route_service.dart';

enum DirectionsConcreteState { initial, loading, failure, fetchedDirections }

class DirectionsState extends Equatable {
  final List<ORSCoordinate> directions;
  final bool isLoading;
  final DirectionsConcreteState state;

  const DirectionsState(
      {this.directions = const [],
      this.isLoading = false,
      this.state = DirectionsConcreteState.initial});

  const DirectionsState.initial(
      {this.directions = const [],
      this.isLoading = false,
      this.state = DirectionsConcreteState.initial});

  DirectionsState copyWith({
    List<ORSCoordinate>? directions,
    bool? isLoading,
    DirectionsConcreteState? state,
  }) {
    return DirectionsState(
        isLoading: isLoading ?? this.isLoading,
        directions: directions ?? this.directions,
        state: state ?? this.state);
  }

  @override
  List<Object?> get props => [directions];
}
