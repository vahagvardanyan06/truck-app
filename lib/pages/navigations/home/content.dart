import 'package:flutter/material.dart';
import 'package:truck_app/pages/navigations/home/appbar.dart';
import 'package:truck_app/pages/navigations/home/body.dart';

class HomeContent extends StatelessWidget {
  final ValueNotifier<String> searchValue;
  final Function(String) onSearchChanged;

  const HomeContent({
    Key? key,
    required this.searchValue,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: Appbar(
              onSearchChanged: onSearchChanged,
              searchValue: searchValue,
            ),
          ),
          body: ValueListenableBuilder<String>(
            valueListenable: searchValue,
            builder: (context, value, child) {
              return Body(searchValue: value);
            },
          ),
        ),
      ),
    );
  }
}
