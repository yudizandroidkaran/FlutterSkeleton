import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_skeleton/model/services/storage_service.dart';
import 'package:get/get.dart' as get_x;
import '../models/response/base_response.dart';
import 'dio_service.dart';

class ApiService {

  final _dio = get_x.Get.find<DioService>().getDio();
  final _storage = get_x.Get.find<StorageService>();

  Future<BaseResponse> _checkResponse(Response response) async {
    if (response.data.toString() != "") {
      return BaseResponse()..setData(response.data);
    } else {
      return BaseResponse()..setData("");
    }
  }

  BaseResponse _prepareError(Object error) {
    return BaseResponse()..setException(jsonDecode((error as DioException).response.toString())["Message"].toString());
  }

  Future<BaseResponse> post<T>(String url, T requestData) async {
    try {
      return await _checkResponse(await _dio.post(url, data: requestData));
    } catch (error) {
      return _prepareError(error);
    }
  }

  Future<BaseResponse> get<T>(String url) async {
    try {
      return await _checkResponse(await _dio.get(url));
    } catch (error) {
      return _prepareError(error);
    }
  }
}
