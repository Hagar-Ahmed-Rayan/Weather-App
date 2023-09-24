import 'Main.dart';
import 'Weather.dart';
import 'Clouds.dart';
import 'Wind.dart';
import 'Sys.dart';

class fivedayesList {
  fivedayesList({
      this.dt, 
      this.main, 
      this.weather, 
      this.clouds, 
      this.wind, 
      this.visibility, 
      this.pop, 
      this.sys, 
      this.dtTxt,});

  fivedayesList.fromJson(dynamic json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }
  num? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  num? visibility;
  num? pop;
  Sys? sys;
  String? dtTxt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    map['visibility'] = visibility;
    map['pop'] = pop;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['dt_txt'] = dtTxt;
    return map;
  }

}