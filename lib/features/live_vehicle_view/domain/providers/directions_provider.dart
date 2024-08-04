import 'package:awr_vehicle_tracker/configs/app_config.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/data/datasource/directions_datasource.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/data/repository_impl/directions_repository.dart';
import 'package:awr_vehicle_tracker/features/live_vehicle_view/domain/repository/directions_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_route_service/open_route_service.dart';

final directionsDatasourceProvider =
    Provider.family<DirectionsDatasource, OpenRouteService>(
  (_, openRouteService) => DirectionsService(client: openRouteService),
);

final directionsRepositoryProvider = Provider<DirectionsRepository>((ref) {
  final openRouteService =
      OpenRouteService(apiKey: AppConfigs.open_route_api_key);
  final datasource = ref.watch(directionsDatasourceProvider(openRouteService));
  final repository = DirectionsRepositoryImpl(datasource);

  return repository;
});
