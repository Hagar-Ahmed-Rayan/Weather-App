import 'package:weather_app/app/data/models/fivedayes/List.dart';

import 'City.dart';

class FivedayesModel {
  FivedayesModel({
      this.cod, 
      this.message, 
      this.cnt, 
      this.list, 
      this.city,});

  FivedayesModel.fromJson(dynamic json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(fivedayesList.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? cod;
  num? message;
  num? cnt;
  List<fivedayesList>? list;
  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }

}