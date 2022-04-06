import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static initStorage() {
    GetStorage box = GetStorage();
    Get.put(box);
  }
}
