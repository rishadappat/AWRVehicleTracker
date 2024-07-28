import 'package:auto_route/auto_route.dart';
import 'package:awr_vehicle_tracker/features/splash/presentation/screen/splash_screen.dart';
import 'package:awr_vehicle_tracker/features/vehicle_list/presentation/screen/vehicle_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
// @override
// replaceInRouteName

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: VehicleListRoute.page),
      ];
}