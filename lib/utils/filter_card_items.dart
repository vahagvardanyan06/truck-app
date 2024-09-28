import 'package:truck_app/types/card_item.dart';

List<CardItem> filterCardItems(List<CardItem> cardItems, String searchValue) {
  return cardItems.where((item) {
    return item.title.toLowerCase().contains(searchValue.toLowerCase());
  }).toList();
}
