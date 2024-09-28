import 'package:get/get.dart';

class ProductDetailStore extends GetxController {
  var productId = ''.obs;

  void setProductId(String id) {
    productId.value = id;
  }
}
