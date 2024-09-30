import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truck_app/constants/assets.dart';
import 'package:truck_app/types/pages.dart';

final Map<Pages, Widget> NavBarDestinations = {
  Pages.home: SvgPicture.asset(
    Assets.homeIcon,
    width: 24,
    height: 24,
  ),
  Pages.map: const Icon(
    Icons.map_outlined,
    size: 24,
  ),
  Pages.graphics: SvgPicture.asset(
    Assets.graphic,
    width: 24,
    height: 24,
  ),
  Pages.profile: const Icon(
    Icons.person,
    size: 24,
  ),
};
