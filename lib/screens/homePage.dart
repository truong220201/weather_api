// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/cityList.dart';
import 'package:flutter_application_4/screens/setting.dart';
import '../component/design/space/spaceWidthHeight.dart';
import '../component/design/fonts/fontTypography.dart';
import 'package:dots_indicator/dots_indicator.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../component/data/infomationController/information.dart';
import '../component/widget/childBoxList/childBox.dart';
import '../component/design/UIdata/uiData.dart';
import '../component/data/dataCity.dart';
import 'package:dio/dio.dart';
import '../model/weather.dart';
import '../controller/cityList_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// int idCT = idCT == null ? idCT = 0 : idCT = Get.parameters['ID'] as int;
int idCT = 0;
String nameCity = ctlist[idCT].namecity;
String img = ctlist[idCT].imge;
String uv = ctlist[idCT].uvIndicator;
String apressure = ctlist[idCT].pressure;
String air = ctlist[idCT].airQuality;
String feld = ctlist[idCT].feltTemp;
String maxtemp = ctlist[idCT].maxtemp;
String mintemp = ctlist[idCT].mintemp;
String weather = ctlist[idCT].weather;
String temp = ctlist[idCT].temp;

final Dio dio = Dio();

class _MyHomePageState extends State<MyHomePage> {
  late Future<Weather> _dataFuture;

  @override
  initState() {
    super.initState();

    _dataFuture = getHttp(nameCitya[Get.arguments ?? 0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Weather>(
      future: _dataFuture,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            //Weather? cityInfo = snapshot.data;
            var a = snapshot.data;
            nameCity = a!.name;
            temp = a.temp;
            maxtemp = a.maxTemp_c;
            mintemp = a.minTemp_c;
            weather = a.weather;
            uv = a.uv;
            feld = a.feldTemp;
            img = a.imgIcon;
            apressure = a.pressure;
            air = 'Air Quality';
          } else {}
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_constructors
              children: const [Text('Loading...'), CircularProgressIndicator()],
            ),
          );
        }

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromARGB(255, 0, 131, 176),
                Color.fromARGB(255, 0, 140, 184),
                Color.fromARGB(255, 0, 180, 219),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          // ignore: sort_child_properties_last
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              flex: 2,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(nameCity,
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: NORMALSIZE,
                                    color: const Color(0xFFFFFFFF),
                                    fontFamily: 'BasierCircle',
                                  )),
                            ),
                            Expanded(
                              child: Text('Jul 13 2021',
                                  style: TextStyle(
                                    fontSize: MINISIZE,
                                    color: const Color.fromARGB(
                                        125, 255, 255, 255),
                                    fontFamily: 'BasierCircle',
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () => Get.to(CityList()),
                          // ignore: prefer_const_constructors
                          child: Icon(
                            Icons.view_quilt_outlined,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 35.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () => Get.to(const SettingForm()),
                          // ignore: prefer_const_constructors
                          child: Icon(
                            Icons.settings,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 35.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 15,
              child: Container(
                  padding: const EdgeInsets.all(00),
                  // ignore: sort_child_properties_last
                  child: LayoutBuilder(
                    builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 250,
                                  decoration: const BoxDecoration(),
                                  child: Column(children: [
                                    Image.network(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "http://" +
                                          img
                                              .replaceFirst(RegExp(r'//'), '')
                                              .toString(),
                                      width: 140.0.pxToPercentage(context),
                                      fit: BoxFit.cover,
                                    ),
                                    Text('$temp°',
                                        style: TextStyle(
                                          fontSize: TITLESIZE,
                                          color: const Color(0xFFFFFFFF),
                                          fontFamily: 'BasierCircle',
                                        )),
                                    Text(weather,
                                        style: TextStyle(
                                          fontSize: STITLESIZE,
                                          color: const Color(0xFFFFFFFF),
                                          fontFamily: 'BasierCircle',
                                        )),
                                  ])),
                              Row(children: [
                                UIdata().infcMin
                                    ? childMiniBox(
                                        title: 'MIN TEMP',
                                        // ignore: prefer_interpolation_to_compose_strings
                                        temperature: mintemp + '°',
                                        minmax: 'Min',
                                      )
                                    : Container(),
                                UIdata().infcMax && UIdata().infcMin
                                    ? spaceWidth()
                                    : Container(),
                                UIdata().infcMax
                                    ? childMiniBox(
                                        title: 'MAX TEMP',
                                        temperature: '$maxtemp°',
                                        minmax: 'Max',
                                      )
                                    : Container(),
                              ]),
                              const spaceHeight(),
                              (UIdata().infcUV ||
                                      UIdata().infcF ||
                                      UIdata().infcP)
                                  ? Row(
                                      children: [
                                        UIdata().infcUV
                                            ? childNormalBox(
                                                title: 'Uv Indicator',
                                                temperature: uv,
                                                minmax: 'Low',
                                                content:
                                                    'Low level during all the day.')
                                            : Container(),
                                        Get.put(InformationController())
                                                    .uvIndicator
                                                    .value &&
                                                (UIdata().infcP ||
                                                    UIdata().infcF)
                                            ? spaceWidth()
                                            : Container(),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                height: 180.0,
                                                child: Column(
                                                  children: [
                                                    UIdata().infcF
                                                        // ignore: prefer_const_constructors
                                                        ? childHalfMiniBox(
                                                            title: 'FEELS LIKE',
                                                            temperature: feld,
                                                          )
                                                        : Container(),
                                                    (UIdata().infcF &&
                                                            UIdata().infcP)
                                                        ? const spaceHeight()
                                                        : Container(),
                                                    UIdata().infcP
                                                        ? childHalfMiniBox(
                                                            title: 'PRESSURE',
                                                            temperature:
                                                                '$apressure hPa',
                                                          )
                                                        : Container()
                                                  ],
                                                ))),
                                        //spaceHeight(),
                                      ],
                                    )
                                  : Container(),
                              const spaceHeight(),
                              for (var i = 0; i < 5; i++) ...[
                                const ChildContainerMini()
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  decoration: const BoxDecoration()),
            ),
            Stack(
              children: [
                Container(
                  color: const Color.fromARGB(0, 255, 193, 7),
                  child: DotsIndicator(
                    dotsCount: 5,
                    position: 2,
                    decorator: const DotsDecorator(
                      color:
                          Color.fromARGB(193, 255, 255, 255), // Inactive color
                      activeColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                )
              ],
            )
          ]),
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
        );
      }),
    )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
