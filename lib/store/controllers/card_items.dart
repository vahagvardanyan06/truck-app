import 'package:get/get.dart';
import 'package:truck_app/types/card_item.dart';

class CardItemsStore extends GetxController {
  var cardItems = <CardItem>[].obs;

  void addCardItem(CardItem item) {
    cardItems.add(item);
  }

  void removeCardItem(CardItem item) {
    cardItems.remove(item);
  }

  void addItems(List<CardItem> items) {
    cardItems.addAll(items);
  }
}
