import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ThemeData themeData = ThemeData.light();
  changeTheme() {
    if (themeData == ThemeData.light()) {
      themeData = ThemeData.dark();
    }
  }

  List<String> teachers = [];
  addNewTeacher(String name) {
    teachers.add(name);
    update();
  }
}
