import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truck_app/components/nav_bar.dart';
import 'package:truck_app/constants/card_items.dart';
import 'package:truck_app/pages/navigations/home/body.dart';
import 'package:truck_app/pages/navigations/home/appbar.dart';
import 'package:truck_app/store/controllers/card_items.dart';
import 'package:get/get.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final searchValue = useState('');

    useEffect(() {
      // will be fetch for items
      Get.find<CardItemsStore>().addItems(card_items);
      return null;
    }, []);

    final onSearchChanged = useCallback((val) {
      searchValue.value = val;
    }, [searchValue]);

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
          body: Body(searchValue: searchValue.value),
          bottomNavigationBar: const NavBar(),
        ),
      ),
    );
  }
}
