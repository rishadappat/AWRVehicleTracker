import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_route_service/open_route_service.dart';

abstract class DirectionsRepository {
  Future<List<ORSCoordinate>> getDirections({required List<LatLng> points});
}
