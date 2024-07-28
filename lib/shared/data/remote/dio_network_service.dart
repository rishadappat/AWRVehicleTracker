
import 'package:awr_vehicle_tracker/configs/app_config.dart';
import 'package:awr_vehicle_tracker/shared/data/remote/network_service.dart';
import 'package:awr_vehicle_tracker/shared/domain/models/either.dart';
import 'package:awr_vehicle_tracker/shared/domain/models/response.dart' as response;
import 'package:awr_vehicle_tracker/shared/exceptions/http_exception.dart';
import 'package:awr_vehicle_tracker/shared/mixins/exception_handler_mixin.dart';
import 'package:dio/dio.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkService(this.dio) {
    dio.options = dioBaseOptions;
    dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }
  
  @override
  Future<Either<AppException, response.Response>> get(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
  
  @override
  Future<Either<AppException, response.Response>> post(String endpoint, {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

}