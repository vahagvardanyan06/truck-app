import 'package:get/get.dart';
import 'package:truck_app/types/pages.dart';

class PagesController extends GetxController {
  var page = Pages.home.obs;
  var index = 0.obs;

  void setPageName(Pages pageName) {
    page.value = pageName;
    index.value = Pages.values.indexOf(pageName);
  }
}
