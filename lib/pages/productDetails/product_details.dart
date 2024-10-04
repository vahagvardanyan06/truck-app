import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:truck_app/pages/productDetails/appbar.dart';
import 'package:truck_app/pages/productDetails/body.dart';
import 'package:truck_app/store/controllers/product_detail.dart';

class ProductDetails extends HookWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.find<ProductDetailStore>().getProduct();

    useEffect(() {
      return null;
    });

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: Appbar(
            productTitle: product.title,
          ),
          body: Body(
            product: product,
          ),
        ),
      ),
    );
  }
}
