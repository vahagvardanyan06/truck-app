import 'package:flutter/material.dart';
import 'package:truck_app/constants/card_items.dart';
import 'package:truck_app/pages/home/components/tab_bar.dart';
import 'package:truck_app/pages/home/components/tab_bar_view.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
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
                  items: card_items,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
