import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/colors.gen.dart';
import 'package:flutter_skeleton/presentation/screens/products/product_list_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../components/loader_overlay.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final _productListController = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {});

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.bgBlack,
        toolbarHeight: 17.w,
        title: Text("Products",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorName.white)),
        centerTitle: true,
      ),
      body: Obx(
        () => LoadingLayout(
          isLoading: _productListController.isLoading.value,
          child: _productListController.products.isEmpty
              ? const Center(child: Text("No Products Available"))
              : ListView.builder(
                  itemCount: _productListController.products.length,
                  padding: EdgeInsets.only(bottom: 4.w),
                  itemBuilder: (context, index) {
                    return _listItem(context, index);
                  }),
        ),
      ),
    );
  }

  Widget _listItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
      decoration: BoxDecoration(
          color: ColorName.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 1.w, spreadRadius: 0.1.w)
          ],
          borderRadius: BorderRadius.circular(2.w)),
      child: Text("${_productListController.products[index].title}",
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
