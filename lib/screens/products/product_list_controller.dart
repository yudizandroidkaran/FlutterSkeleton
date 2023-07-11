import 'package:flutter_skeleton/constants/apis.dart';
import 'package:flutter_skeleton/services/api_service.dart';
import 'package:flutter_skeleton/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import '../../models/response/products.dart';

class ProductListController extends GetxController {
  var isLoading = true.obs;
  var products = <Products>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    _getProducts();
  }

  void _getProducts() {
    ApiService().get(Apis.products).then((value) {
      if (!value.isError) {
        products.value = productsFromJson(value.getData);
        isLoading.value = false;
      } else {
        SnackBarUtil.showErrorSnackBar(value.getException);
        isLoading.value = false;
      }
    });
  }
}
