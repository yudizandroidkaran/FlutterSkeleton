import 'package:get/get.dart';
import '../products/product_list.dart';

class SplashController extends GetxController {

  void navigateToProducts(){

    Future.delayed(const Duration(seconds: 1), () {
      Get.to(ProductList());
    });
  }
}
