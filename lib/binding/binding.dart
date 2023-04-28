import 'package:flutter_application_4/screens/setting.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../main.dart';
import '../screens/cityList.dart';

class CityListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CityList>(
      () => CityList(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyApp>(
      () => const MyApp(),
    );
  }
}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingForm>(
      () => const SettingForm(),
    );
  }
}
