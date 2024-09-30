import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_app/constants/nav_bar_destinations.dart';
import 'package:truck_app/store/controllers/pages.dart';
import 'package:truck_app/types/pages.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final PagesController pagesController = Get.find<PagesController>();

    void handleOnDestinationSelected(int index) {
      pagesController.setPageName(Pages.values[index]);
    }

    return Obx(() {
      return NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        selectedIndex: pagesController.index.value,
        onDestinationSelected: handleOnDestinationSelected,
        destinations: NavBarDestinations.entries.map((entry) {
          final isSelected = pagesController.page.value == entry.key;

          return NavigationDestination(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.black : Colors.grey,
                BlendMode.srcIn,
              ),
              child: entry.value,
            ),
            label: '',
          );
        }).toList(),
        backgroundColor: Colors.white,
        height: 50,
      );
    });
  }
}
