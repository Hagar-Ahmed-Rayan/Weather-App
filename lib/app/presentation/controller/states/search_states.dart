

import 'package:equatable/equatable.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';

abstract class searchState extends Equatable {
  const searchState();

  @override
  List<Object> get props => [];
}

class search_Initial extends searchState {}

class search_sucess extends searchState {}

