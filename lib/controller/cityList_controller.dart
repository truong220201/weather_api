// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import '../../component/data/infomationController/information.dart';
import '../../component/design/UIdata/uiData.dart';
import 'package:dio/dio.dart';
import '../../screens/homePage.dart';
import '../model/weather.dart';

Future<Weather> getHttp(String info) async {
  //String res;
  //print('aaaaaaa');
  try {
    final response =
        await dio.get(ConnectToApi.fullURL + info + ConnectToApi.inf);

    return Weather.fromJson(response.data);
  } on DioError catch (e) {
    trueFalse = false;
    print(e);
    throw Exception('Failed');
  }
}
