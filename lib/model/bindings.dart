import 'package:flutter_skeleton/model/services/api_service.dart';
import 'package:flutter_skeleton/model/services/dio_service.dart';
import 'package:flutter_skeleton/model/services/storage_service.dart';
import 'package:get/get.dart';

import '../presentation/screens/products/product_list_controller.dart';
import '../presentation/screens/splash/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    //Controllers
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => ProductListController(), fenix: true);

    //Services
    Get.lazyPut(() => StorageService());
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => DioService());
  }
}
