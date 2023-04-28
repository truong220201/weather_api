// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, missing_required_param, unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/cityList.dart';
import 'package:flutter_application_4/screens/setting.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'binding/binding.dart';
import 'screens/homePage.dart';

void main() {
  runApp(const MyApp(
    id: null,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, @required this.id});
  final id;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/', page: () => MyApp(), binding: HomeBinding()),
        GetPage(
            name: '/setting',
            page: () => SettingForm(),
            binding: SettingBinding()),
        GetPage(
            name: '/city', page: () => CityList(), binding: CityListBinding()),
      ],
    );
  }
}
