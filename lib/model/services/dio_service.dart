import 'package:dio/dio.dart';

import '../constants/apis.dart';

class DioService {
  final Dio dio = Dio();

  getDio() {
    return _generateDio(dio);
  }

  Dio _generateDio(Dio dio) {
    dio.interceptors.add(LogInterceptor());

    dio.options.receiveDataWhenStatusError = true;
    dio.options.sendTimeout = const Duration(milliseconds: 60000);
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.options.baseUrl = Apis.baseUrl;

    return dio;
  }
}
