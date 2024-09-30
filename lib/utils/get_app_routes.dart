import 'package:flutter/material.dart';
import 'package:truck_app/constants/routes.dart';
import 'package:truck_app/pages/navigations/graphicsPage/graphic_page.dart';
import 'package:truck_app/pages/navigations/home/home.dart';
import 'package:truck_app/pages/navigations/map/map.dart';
import 'package:truck_app/pages/navigations/profilePage/profile_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    Routes.home: (BuildContext context) => const Home(),
    Routes.map: (BuildContext context) => const MapPage(),
    Routes.graphics: (BuildContext context) => const GraphicsPage(),
    Routes.profile: (BuildContext context) => const ProfilePage(),
  };
}
