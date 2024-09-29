import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:truck_app/constants/assets.dart';
import 'package:truck_app/store/controllers/pages.dart';
import 'package:truck_app/types/pages.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PagesController pagesController = Get.find<PagesController>();
    final selectedIndex = Pages.values.indexOf(pagesController.page.value);

    void handleOnDestinationSelected(int index) {
      pagesController.setPageName(Pages.values[index]);
    }

    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Colors.transparent,
      selectedIndex: selectedIndex,
      onDestinationSelected: handleOnDestinationSelected, // Use the new method
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            Assets.homeIcon,
            width: 24,
            height: 24,
            color: pagesController.page.value == Pages.home
                ? Colors.black
                : Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.map_outlined,
            size: 24,
            color: pagesController.page.value == Pages.map
                ? Colors.black
                : Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            Assets.graphic,
            width: 24,
            height: 24,
            color: pagesController.page.value == Pages.graphics
                ? Colors.black
                : Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person,
            size: 24,
            color: pagesController.page.value == Pages.profile
                ? Colors.black
                : Colors.grey,
          ),
          label: '',
        ),
      ],
      backgroundColor: Colors.white,
      height: 50,
    );
  }
}
