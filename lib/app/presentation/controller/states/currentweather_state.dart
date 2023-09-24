

import 'package:equatable/equatable.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

class current_weather_Initial extends CurrentWeatherState {}

class current_weather_Loading extends CurrentWeatherState {}

class current_weather_Failure extends CurrentWeatherState {
  final String errorMessage;

  const current_weather_Failure(this.errorMessage);
}

class current_weather_Success extends CurrentWeatherState {
  final TodayWeatherModel todayWeatherModel;

  const current_weather_Success(this.todayWeatherModel);
}