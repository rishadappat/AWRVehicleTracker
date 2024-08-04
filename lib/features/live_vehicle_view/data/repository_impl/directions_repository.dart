import 'package:awr_vehicle_tracker/features/live_vehicle_view/data/datasource/directions_datasource.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/domain/repository/directions_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_route_service/open_route_service.dart';

class DirectionsRepositoryImpl extends DirectionsRepository {
  final DirectionsDatasource directionsDatasource;
  DirectionsRepositoryImpl(this.directionsDatasource);

  @override
  Future<List<ORSCoordinate>> getDirections({required List<LatLng> points}) {
    return directionsDatasource.getDirections(points: points);
  }
}
