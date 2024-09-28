import 'package:flutter/material.dart';
import 'package:truck_app/components/card_info.dart';
import 'package:get/get.dart';
import 'package:truck_app/pages/productDetails/product_details.dart';
import 'package:truck_app/store/controllers/product_detail.dart';
import 'package:truck_app/types/card_item.dart';

class HomeTabBarView extends StatelessWidget {
  final List<CardItem> items;

  const HomeTabBarView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final lockedItems = items.where((item) => item.isLocked).toList();
    final unlockedItems = items.where((item) => !item.isLocked).toList();

    onItemTap(String id) {
      Get.find<ProductDetailStore>().setProductId(id);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetails()),
      );
    }

    Widget _buildListView(List<CardItem> itemList, String emptyMessage) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: itemList.isNotEmpty
              ? itemList.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: CardInfo(
                      title: item.title,
                      imageUrl: item.imageUrl,
                      location: item.location,
                      speed: item.speed,
                      isLocked: item.isLocked,
                      time: item.time,
                      onTap: () => onItemTap(item.id),
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
