import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_app/store/controllers/card_items.dart';
import 'package:truck_app/pages/navigations/home/components/tab_bar.dart';
import 'package:truck_app/pages/navigations/home/components/tab_bar_view.dart';
import 'package:truck_app/utils/filter_card_items.dart';

class Body extends StatefulWidget {
  final String searchValue;
  const Body({super.key, required this.searchValue});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final cardItems = Get.find<CardItemsStore>().cardItems;

    final filteredItems = widget.searchValue.isEmpty
        ? cardItems
        : filterCardItems(cardItems, widget.searchValue);

    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              children: [
                const HomeTabBar(),
                HomeTabBarView(
                  items: filteredItems,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
