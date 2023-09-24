

import 'package:equatable/equatable.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';

abstract class othercountriesWeatherState extends Equatable {
  const othercountriesWeatherState();

  @override
  List<Object> get props => [];
}

class othercountries_weather_Initial extends othercountriesWeatherState {}

class othercountries_weather_Loading extends othercountriesWeatherState {}

class othercountries_Failure extends othercountriesWeatherState {
  final String errorMessage;

  const othercountries_Failure(this.errorMessage);
}

class othercountries_Success extends othercountriesWeatherState {
  final TodayWeatherModel othercuntries;

  const othercountries_Success(this.othercuntries);
}