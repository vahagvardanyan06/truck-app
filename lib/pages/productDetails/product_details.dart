import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:truck_app/components/nav_bar.dart';
import 'package:truck_app/store/controllers/product_detail.dart';

class ProductDetails extends HookWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = Get.find<ProductDetailStore>().productId.value;

    useEffect(() {
      return null;
    });

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: Center(child: Text(productId)),
        bottomNavigationBar: NavBar(),
      )),
    );
  }
}
