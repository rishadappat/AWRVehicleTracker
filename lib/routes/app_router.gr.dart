// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [LiveAllVehiclesViewScreen]
class LiveAllVehiclesViewRoute extends PageRouteInfo<void> {
  const LiveAllVehiclesViewRoute({List<PageRouteInfo>? children})
      : super(
          LiveAllVehiclesViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LiveAllVehiclesViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LiveAllVehiclesViewScreen();
    },
  );
}

/// generated route for
/// [LiveVehicleView]
class LiveVehicleViewRoute extends PageRouteInfo<LiveVehicleViewArgs> {
  LiveVehicleViewRoute({
    Key? key,
    required Vehicle vehicle,
    List<PageRouteInfo>? children,
  }) : super(
          LiveVehicleViewRoute.name,
          args: LiveVehicleViewArgs(
            key: key,
            vehicle: vehicle,
          ),
          initialChildren: children,
        );

  static const String name = 'LiveVehicleView';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveVehicleViewArgs>();
      return LiveVehicleView(
        key: args.key,
        vehicle: args.vehicle,
      );
    },
  );
}

class LiveVehicleViewArgs {
  const LiveVehicleViewArgs({
    this.key,
    required this.vehicle,
  });

  final Key? key;

  final Vehicle vehicle;

  @override
  String toString() {
    return 'LiveVehicleViewArgs{key: $key, vehicle: $vehicle}';
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
