import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_skeleton/services/storage_service.dart';
import 'package:get/get.dart' as get_x;
import '../constants/apis.dart';
import '../models/response/base_response.dart';
import 'dio_service.dart';

class ApiService {
  Dio dio = MyDio().getDio();
  final storage = get_x.Get.find<StorageService>();

  Future<BaseResponse> checkResponse(Response response) async {
    if (response.data.toString() != "") {
      return BaseResponse()..setData(response.data);
    } else {
      return BaseResponse()..setData("");
    }
  }

  BaseResponse prepareError(Object error) {
    return BaseResponse()..setException(jsonDecode((error as DioException).response.toString())["Message"].toString());
  }

  Future<BaseResponse> post<T>(String url, T requestData) async {
    try {
      return await checkResponse(await dio.post(url, data: requestData));
    } catch (error) {
      return prepareError(error);
    }
  }

  Future<BaseResponse> get<T>(String url) async {
    try {
      return await checkResponse(await dio.get(url));
    } catch (error) {
      return prepareError(error);
    }
  }
}
