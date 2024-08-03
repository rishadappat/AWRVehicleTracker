// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [LiveVehicleViewScreen]
class LiveVehicleViewRoute extends PageRouteInfo<LiveVehicleViewRouteArgs> {
  LiveVehicleViewRoute({
    required List<Vehicle> vehicles,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LiveVehicleViewRoute.name,
          args: LiveVehicleViewRouteArgs(
            vehicles: vehicles,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LiveVehicleViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveVehicleViewRouteArgs>();
      return LiveVehicleViewScreen(
        args.vehicles,
        key: args.key,
      );
    },
  );
}

class LiveVehicleViewRouteArgs {
  const LiveVehicleViewRouteArgs({
    required this.vehicles,
    this.key,
  });

  final List<Vehicle> vehicles;

  final Key? key;

  @override
  String toString() {
    return 'LiveVehicleViewRouteArgs{vehicles: $vehicles, key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [VehicleListScreen]
class VehicleListRoute extends PageRouteInfo<void> {
  const VehicleListRoute({List<PageRouteInfo>? children})
      : super(
          VehicleListRoute.name,
          initialChildren: children,
        );

  static const String name = 'VehicleListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VehicleListScreen();
    },
  );
}
