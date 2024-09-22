import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truck_app/constants/assets.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Colors.transparent,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            Assets.homeIcon,
            width: 24,
            height: 24,
            color: selectedIndex == 0 ? Colors.black : Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.map_outlined,
            size: 24,
            color: selectedIndex == 1 ? Colors.black : Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            Assets.graphic,
            width: 24,
            height: 24,
            color: selectedIndex == 2 ? Colors.black : Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person,
            size: 24,
            color: selectedIndex == 3 ? Colors.black : Colors.grey,
          ),
          label: '',
        ),
      ],
      backgroundColor: Colors.white,
      height: 50,
    );
  }
}
