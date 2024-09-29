import 'package:flutter/material.dart';
import 'package:truck_app/pages/navigations/graphicsPage/graphic_page.dart';
import 'package:truck_app/pages/navigations/home/home.dart';
import 'package:truck_app/pages/navigations/map/map.dart';
import 'package:truck_app/pages/navigations/profilePage/profile_page.dart';
import 'package:truck_app/types/pages.dart';

final Map<Pages, Widget> PageWidgets = {
  Pages.home: const Home(),
  Pages.map: const MapPage(),
  Pages.graphics: const GraphicsPage(),
  Pages.profile: const ProfilePage(),
};
