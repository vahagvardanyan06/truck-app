import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_app/constants/routes.dart';
import 'package:truck_app/store/controllers/pages.dart';
import 'package:truck_app/types/card_item.dart';
import 'package:truck_app/types/pages.dart';

class Body extends StatelessWidget {
  final CardItem product;
  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 36,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: GestureDetector(
                    onTap: onLocationTap,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            product.location,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            Container(
              width: double.infinity,
              height: screenWidth * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
