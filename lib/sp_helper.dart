import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static initSharedPrefrences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Get.put(sharedPreferences);
  }
}
