// ignore: depend_on_referenced_packages
// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, unused_local_variable, file_names, duplicate_ignore

import 'package:get/get.dart';
import '../data/dataCity.dart';

// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import '../../component/data/infomationController/information.dart';
import '../../component/design/UIdata/uiData.dart';
import 'package:dio/dio.dart';
import '../../screens/homePage.dart';

void changeC(int a) {
  Get.toNamed('/', arguments: a);
}

void Add_City(String name) {
  nameCitya.add(name);
  Get.toNamed('/city');
}

void deleteName(var isChecked) {
  {
    for (int i = 0; i < nameCitya.length; i++) {
      if (isChecked[i] == true) {
        nameCitya.removeAt(i);

        Get.toNamed('/city');
      }
    }
  }
}

initDB() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? counter = prefs.getInt('counter');
}

void checkHttp(String info) async {
  try {
    final response =
        await dio.get(ConnectToApi.fullURL + info + ConnectToApi.inf);
    trueFalse = true;
  } on DioError {
    trueFalse = false;
    throw Exception('Failed');
  }
}
