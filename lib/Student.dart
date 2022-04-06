import 'package:get/get.dart';

class Student {
  RxList<String> x = <String>[].obs;
  addNewStringToList(String content) {
    x.add(content);
  }
}
