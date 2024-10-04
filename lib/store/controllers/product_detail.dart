import 'package:get/get.dart';
import 'package:truck_app/constants/card_items.dart';
import 'package:truck_app/types/card_item.dart';

class ProductDetailStore extends GetxController {
  var productId = ''.obs;

  void setProductId(String id) {
    productId.value = id;
  }

  CardItem getProduct() {
    return card_items.firstWhere(
      (item) => item.id == productId.value,
    );
  }
}
