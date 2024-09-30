import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:truck_app/constants/card_items.dart';
import 'package:truck_app/constants/routes.dart';
import 'package:truck_app/pages/navigations/home/content.dart';
import 'package:truck_app/pages/productDetails/product_details.dart';
import 'package:truck_app/store/controllers/card_items.dart';
import 'package:get/get.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final searchValue = useState('');

    useEffect(() {
      // Fetch items
      Get.find<CardItemsStore>().addItems(card_items);
      return null;
    }, []);

    final onSearchChanged = useCallback((val) {
      searchValue.value = val;
    }, [searchValue]);

    return Navigator(
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        Widget page = settings.name == Routes.productDetail
            ? const ProductDetails()
            : HomeContent(
                searchValue: searchValue, onSearchChanged: onSearchChanged);

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: page,
          ),
        );
      },
    );
  }
}
