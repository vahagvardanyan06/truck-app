import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truck_app/components/nav_bar.dart';
import 'package:truck_app/constants/card_items.dart';
import 'package:truck_app/pages/home/body.dart';
import 'package:truck_app/pages/home/appbar.dart';
import 'package:truck_app/store/controllers/card_items.dart';
import 'package:get/get.dart';
import 'package:truck_app/store/controllers/general.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final searchValue = useState('');
    final selectedIndex = useState(0);

    useEffect(() {
      // store init here
      Get.put(GeneralController());
      // will be fetch for items
      Get.find<CardItemsStore>().addItems(card_items);
      return null;
    }, []);

    final onSearchChanged = useCallback((val) {
      searchValue.value = val;
    }, [searchValue]);

    void onNavDestinationSelected(int index) {
      selectedIndex.value = index;
    }

    final List<Widget> tabWidgets = [
      Body(
        searchValue: searchValue.value,
      ),
      Center(child: Text('Map Tab Content')),
      Center(child: Text('Graphics Tab Content')),
      Center(child: Text('Profile Tab Content')),
    ];

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
          body: tabWidgets[selectedIndex.value],
          bottomNavigationBar: NavBar(
            selectedIndex: selectedIndex.value,
            onDestinationSelected: onNavDestinationSelected,
          ),
        ),
      ),
    );
  }
}
