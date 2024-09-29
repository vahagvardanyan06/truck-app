import 'package:flutter/material.dart';
import 'package:truck_app/components/tab_item.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: const TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black54,
        tabs: [
          TabItem(
            title: 'All',
          ),
          TabItem(
            title: 'Standing',
          ),
          TabItem(
            title: 'On the way',
          ),
        ],
      ),
    );
  }
}
