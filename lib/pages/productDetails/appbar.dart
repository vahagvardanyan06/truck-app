import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String productTitle;

  const Appbar({super.key, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    void onSettingsPressed() {
      print('settings presssed');
    }

    void onCalendarPressed() {
      print('calendar pressed');
    }

    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        productTitle,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
          onPressed: onCalendarPressed,
          icon: const Icon(Icons.calendar_month_outlined),
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          onPressed: onSettingsPressed,
          icon: const Icon(Icons.settings),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
