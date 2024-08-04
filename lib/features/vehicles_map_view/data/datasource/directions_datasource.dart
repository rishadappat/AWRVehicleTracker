import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_route_service/open_route_service.dart';

abstract class DirectionsDatasource {
  Future<List<ORSCoordinate>> getDirections({required List<LatLng> points});
}

class DirectionsService extends DirectionsDatasource {
  final OpenRouteService client;

  DirectionsService({required this.client});

  @override
  Future<List<ORSCoordinate>> getDirections({required List<LatLng> points}) {
    List<ORSCoordinate> coordinates = points
        .map((point) => ORSCoordinate(
            latitude: point.latitude, longitude: point.longitude, altitude: 0))
        .toList();
    final response =
        client.directionsMultiRouteCoordsPost(coordinates: coordinates);
    return response;
  }
}
