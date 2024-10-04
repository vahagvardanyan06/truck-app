import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String productTitle;

  const Appbar({super.key, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    void onSettingsPressed() {
      print('settings presssed');
    }

    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        productTitle,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: onSettingsPressed,
        ),
      ],
    );
  }

  // This is required to specify the size of the custom AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
