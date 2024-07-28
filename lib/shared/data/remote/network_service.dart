

import 'package:awr_vehicle_tracker/shared/domain/models/either.dart';
import 'package:awr_vehicle_tracker/shared/exceptions/http_exception.dart';
import 'package:awr_vehicle_tracker/shared/domain/models/response.dart' as response;

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, response.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}