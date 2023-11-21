// Data model generated using https://quicktype.io/dart
// To parse this JSON data, do
//
//     final prediction = predictionFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

Prediction predictionFromJson(String str) =>
    Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
  String product;
  DateTime init;
  List<Dataserie> dataseries;

  Prediction({
    required this.product,
    required this.init,
    required this.dataseries,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        product: json["product"],
        init: DateTime.parse(json["init"]),
        dataseries: List<Dataserie>.from(json["dataseries"]
            .map((x) => Dataserie.fromJson(x, DateTime.parse(json["init"])))),
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "init": init,
        "dataseries": List<dynamic>.from(dataseries.map((x) => x.toJson())),
      };
}

class Dataserie {
  DateTime timepoint;
  int cloudcover;
  int liftedIndex;
  PrecType precType;
  int precAmount;
  int temp2M;
  String rh2M;
  Wind10M wind10M;
  String weather;

  Dataserie({
    required this.timepoint,
    required this.cloudcover,
    required this.liftedIndex,
    required this.precType,
    required this.precAmount,
    required this.temp2M,
    required this.rh2M,
    required this.wind10M,
    required this.weather,
  });

  factory Dataserie.fromJson(Map<String, dynamic> json, DateTime baseDate) =>
      Dataserie(
        timepoint: baseDate.add(Duration(hours: json["timepoint"])),
        cloudcover: json["cloudcover"],
        liftedIndex: json["lifted_index"],
        precType: precTypeValues.map[json["prec_type"]]!,
        precAmount: json["prec_amount"],
        temp2M: json["temp2m"],
        rh2M: json["rh2m"],
        wind10M: Wind10M.fromJson(json["wind10m"]),
        weather: json["weather"],
      );

  Map<String, dynamic> toJson() => {
        "timepoint": timepoint,
        "cloudcover": cloudcover,
        "lifted_index": liftedIndex,
        "prec_type": precTypeValues.reverse[precType],
        "prec_amount": precAmount,
        "temp2m": temp2M,
        "rh2m": rh2M,
        "wind10m": wind10M.toJson(),
        "weather": weather,
      };

  IconData get iconData {
    switch (weather) {
      case 'clearday':
        return WeatherIcons.day_sunny;
      case 'pcloudyday':
        return WeatherIcons.day_cloudy;
      case 'mcloudyday':
        return WeatherIcons.cloud;
      case 'cloudyday':
        return WeatherIcons.cloudy;
      case 'humidday':
        return WeatherIcons.humidity;
      case 'lightrainday':
        return WeatherIcons.sprinkle;
      case 'oshowerday':
        return WeatherIcons.showers;
      case 'ishowerday':
        return WeatherIcons.rain;
      case 'lightsnowday':
        return WeatherIcons.sleet;
      case 'rainday':
        return WeatherIcons.rain;
      case 'snowday':
        return WeatherIcons.snow;
      case 'rainsnowday':
        return WeatherIcons.rain_mix;
      case 'tsday':
        return WeatherIcons.storm_showers;
      case 'tsrainday':
        return WeatherIcons.thunderstorm;
      case 'clearnight':
        return WeatherIcons.night_clear;
      case 'pcloudynight':
        return WeatherIcons.night_cloudy;
      case 'mcloudynight':
        return WeatherIcons.cloud;
      case 'cloudynight':
        return WeatherIcons.cloudy;
      case 'humidnight':
        return WeatherIcons.humidity;
      case 'lightrainnight':
        return WeatherIcons.sprinkle;
      case 'oshowernight':
        return WeatherIcons.showers;
      case 'ishowernight':
        return WeatherIcons.rain;
      case 'lightsnownight':
        return WeatherIcons.sleet;
      case 'rainnight':
        return WeatherIcons.rain;
      case 'snownight':
        return WeatherIcons.snow;
      case 'rainsnownight':
        return WeatherIcons.rain_mix;
      case 'tsnight':
        return WeatherIcons.storm_showers;
      case 'tsrainnight':
        return WeatherIcons.thunderstorm;
      default:
        return WeatherIcons.humidity;
    }
  }
}

enum PrecType { NONE, RAIN }

final precTypeValues =
    EnumValues({"none": PrecType.NONE, "rain": PrecType.RAIN});

class Wind10M {
  Direction? direction;
  int speed;

  Wind10M({
    required this.direction,
    required this.speed,
  });

  factory Wind10M.fromJson(Map<String, dynamic> json) => Wind10M(
        direction: directionValues.map[json["direction"]],
        speed: json["speed"],
      );

  Map<String, dynamic> toJson() => {
        "direction": directionValues.reverse[direction],
        "speed": speed,
      };
}

enum Direction { E, N, NE, NW, S, SE, SW }

final directionValues = EnumValues({
  "E": Direction.E,
  "N": Direction.N,
  "NE": Direction.NE,
  "NW": Direction.NW,
  "S": Direction.S,
  "SE": Direction.SE,
  "SW": Direction.SW
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
