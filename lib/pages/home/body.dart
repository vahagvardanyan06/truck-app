import 'package:flutter/material.dart';
import 'package:truck_app/components/tab_item.dart';

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
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the TabBar
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ), // Border color and width
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12), // Rounded corners
                    ),
                  ),
                  child: TabBar(
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
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text('All Content')),
                      Center(child: Text('Standing Content')),
                      Center(child: Text('On the way Content')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
