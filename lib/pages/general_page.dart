import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:truck_app/constants/pages.dart';
import 'package:truck_app/store/general.dart';
import 'package:truck_app/store/controllers/pages.dart';

class GeneralPage extends HookWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Initialize store
      Get.put(GeneralController());
      return null;
    }, []);

    final PagesController pagesController = Get.find<PagesController>();

    return Obx(() {
      return PageWidgets[pagesController.page.value] as Widget;
    });
  }
}
