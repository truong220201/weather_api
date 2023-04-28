// ignore_for_file: non_constant_identifier_names

class Weather {
  final String maxTemp_c;
  final String name;
  final String temp;
  final String minTemp_c;
  final String uv;
  final String pressure;
  final String imgIcon;
  final String weather;
  final String feldTemp;

  Weather({
    required this.maxTemp_c,
    required this.name,
    required this.temp,
    required this.minTemp_c,
    required this.uv,
    required this.pressure,
    required this.imgIcon,
    required this.weather,
    required this.feldTemp,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      maxTemp_c:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      name: json['location']['name'].toString(),
      temp: json['current']['temp_c'].toString(),
      minTemp_c:
          json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      uv: json['current']['uv'].toString(),
      pressure: json['current']['pressure_mb'].toString(),
      imgIcon: json['current']['condition']['icon'].toString(),
      weather: json['current']['condition']['text'].toString(),
      feldTemp: json['current']['feelslike_c'].toString(),
    );
  }
}
