import 'package:flutter/material.dart';
import 'package:truck_app/pages/navigations/graphicsPage/graphic_page.dart';
import 'package:truck_app/pages/navigations/home/home.dart';
import 'package:truck_app/pages/navigations/map/map.dart';
import 'package:truck_app/pages/navigations/profilePage/profile_page.dart';

List<Widget> NavigationPagesList = const [
  Home(),
  MapPage(),
  GraphicsPage(),
  ProfilePage(),
];
