import 'package:flutter/material.dart';
import 'package:truck_app/components/card_info.dart';
import 'package:truck_app/types/card_item.dart';

class HomeTabBarView extends StatelessWidget {
  final List<CardItem> items;

  const HomeTabBarView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final lockedItems = items.where((item) => item.isLocked).toList();
    final unlockedItems = items.where((item) => !item.isLocked).toList();

    Widget _buildListView(List<CardItem> itemList, String emptyMessage) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: itemList.isNotEmpty
              ? itemList.map((truck) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: CardInfo(
                      title: truck.title,
                      imageUrl: truck.imageUrl,
                      location: truck.location,
                      speed: truck.speed,
                      isLocked: truck.isLocked,
                      time: truck.time,
                    ),
                  );
                }).toList()
              : [Center(child: Text(emptyMessage))],
        ),
      );
    }

    return Expanded(
      child: TabBarView(
        children: [
          _buildListView(items, 'No Items'),
          _buildListView(lockedItems, 'No Locked Items'),
          _buildListView(unlockedItems, 'No Unlocked Items'),
        ],
      ),
    );
  }
}
