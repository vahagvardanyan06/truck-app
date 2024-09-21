import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truck_app/components/text_field.dart';
import 'package:truck_app/constants/assets.dart';

class Appbar extends HookWidget {
  final Function(String) onSearchChanged;
  final ValueNotifier<String> searchValue;
  const Appbar(
      {super.key, required this.onSearchChanged, required this.searchValue});

  @override
  Widget build(BuildContext context) {
    void onCancelTap() {
      print(searchValue.value);
      searchValue.value = '';
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: TextFieldComponent(
                onChanged: onSearchChanged,
                placeHolder: 'Search',
                startIcon: const Icon(Icons.search),
                endIcon: const Icon(Icons.cancel_outlined),
                onEndIconTap: onCancelTap,
              ),
            ),
            const SizedBox(width: 15),
            SvgPicture.asset(
              Assets.moreIcon,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
