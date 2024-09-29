import 'package:get/get.dart';
import 'package:truck_app/store/controllers/card_items.dart';
import 'package:truck_app/store/controllers/pages.dart';
import 'package:truck_app/store/controllers/product_detail.dart';

class GeneralController extends GetxController {
  final CardItemsStore cardItemStore = Get.put(CardItemsStore());
  final ProductDetailStore productDetailStore = Get.put(ProductDetailStore());
  final PagesController pagesStore = Get.put(PagesController());
}
