import 'package:get/get.dart';
import 'package:truck_app/types/pages.dart';

class PagesController extends GetxController {
  var page = Pages.home.obs;

  void setPageName(Pages pageName) {
    page.value = pageName;
  }
}
