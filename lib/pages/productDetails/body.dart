import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_app/pages/productDetails/driver_info.dart';
import 'package:truck_app/pages/productDetails/location_button.dart';
import 'package:truck_app/pages/productDetails/product_image.dart';
import 'package:truck_app/store/controllers/pages.dart';
import 'package:truck_app/types/card_item.dart';
import 'package:truck_app/types/pages.dart';

class Body extends StatelessWidget {
  final CardItem product;
  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final PagesController pagesController = Get.find<PagesController>();
    final mapIndex = Pages.values.indexOf(Pages.map);

    void onLocationTap() {
      pagesController.setPageName(Pages.values[mapIndex]);
    }

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            LocationButton(
              onLocationTap: onLocationTap,
              location: product.location,
            ),
            ProductImage(imageUrl: product.imageUrl),
            DriverInfo(
              fullName: product.driverInfo.fullName,
              profileImageUrl: product.driverInfo.profileImageUrl,
              phoneNumber: product.driverInfo.phoneNumber,
            )
          ],
        ),
      ),
    );
  }
}
