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

    return Expanded(
      child: TabBarView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: items.map((truck) {
                return CardInfo(
                  title: truck.title,
                  imageUrl: truck.imageUrl,
                  location: truck.location,
                  speed: truck.speed,
                  isLocked: truck.isLocked,
                  time: truck.time,
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: lockedItems.isNotEmpty
                  ? lockedItems.map((truck) {
                      return CardInfo(
                        title: truck.title,
                        imageUrl: truck.imageUrl,
                        location: truck.location,
                        speed: truck.speed,
                        isLocked: truck.isLocked,
                        time: truck.time,
                      );
                    }).toList()
                  : [const Center(child: Text('No Locked Items'))],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: unlockedItems.isNotEmpty
                  ? unlockedItems.map((truck) {
                      return CardInfo(
                        title: truck.title,
                        imageUrl: truck.imageUrl,
                        location: truck.location,
                        speed: truck.speed,
                        isLocked: truck.isLocked,
                        time: truck.time,
                      );
                    }).toList()
                  : [const Center(child: Text('No Unlocked Items'))],
            ),
          ),
        ],
      ),
    );
  }
}
