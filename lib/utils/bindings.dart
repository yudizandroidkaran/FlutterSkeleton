import 'package:get/get.dart';

import '../screens/splash/splash_controller.dart';
import '../services/storage_service.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    //Controllers
    Get.lazyPut(() => SplashController(), fenix: true);

    //Services
    Get.lazyPut(() => StorageService());
  }
}
