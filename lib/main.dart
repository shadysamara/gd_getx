import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gd_getx/Student.dart';
import 'package:gd_getx/homeController.dart';
import 'package:gd_getx/sp_helper.dart';
import 'package:gd_getx/storage_helper.dart';
import 'package:gd_getx/translation_content.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.initSharedPrefrences();
  StorageHelper.initStorage();
  runApp(GetMaterialApp(
    translations: Messages(), // your translations
    locale: Locale('en', 'US'), // translations will be displayed in that locale
    fallbackLocale: Locale('en',
        'US'), // specify the fallback locale in case an invalid locale is selected.

    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp() {
    Get.put(Student());
  }
  String? content;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hello'.tr),
                  ...Get.find<Student>().x.map((e) {
                    return Text(e);
                  }),
                  TextField(
                    onChanged: (v) {
                      content = v;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.put(Student());
                      },
                      child: const Text('create student dependency')),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.updateLocale(Locale('ar_SA'));
                        // Get.find<GetStorage>().write('name', 'shaker');
                        // log(Get.find<GetStorage>().read('name'));

                        // Get.bottomSheet(Container(
                        //   color: Colors.white,
                        // ));
                        // Get.dialog(AlertDialog(
                        //   title: Text('title'),
                        //   content: Text('content'),
                        //   actions: [
                        //     ElevatedButton(onPressed: () {}, child: Text('ok'))
                        //   ],
                        // ));
                        // Get.rawSnackbar(title: 'title', message: 'message');
                        // Get.to(HomePage(),
                        //     transition: Transition.fade,
                        //     duration: Duration(seconds: 5));
                        // log(Get.isRegistered<Student>().toString());
                        // Get.find<Student>().addNewStringToList(content ?? '');
                        // log(Get.find<Student>().x);
                      },
                      child: const Text('get students value')),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: controller.teachers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Text(controller.teachers[index]),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue),
                            );
                          })),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: this.controller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      )),
                      GestureDetector(
                        onTap: () {
                          controller.addNewTeacher(this.controller.text);
                          this.controller.clear();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.orangeAccent),
                          child: Icon(Icons.send),
                        ),
                      )
                    ],
                  )
                ],
              );
            }));
  }
}
