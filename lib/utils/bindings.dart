import 'package:get/get.dart';

import '../screens/products/product_list_controller.dart';
import '../screens/splash/splash_controller.dart';
import '../services/storage_service.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    //Controllers
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => ProductListController(), fenix: true);

    //Services
    Get.lazyPut(() => StorageService());
  }
}
