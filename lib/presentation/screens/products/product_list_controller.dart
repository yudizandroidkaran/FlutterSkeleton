import 'package:get/get.dart';

import '../../../model/constants/apis.dart';
import '../../../model/models/response/products.dart';
import '../../../model/services/api_service.dart';
import '../../../utils/snack_bar_utils.dart';

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
