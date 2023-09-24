

import 'package:equatable/equatable.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';

abstract class changemodeState extends Equatable {
  const changemodeState();

  @override
  List<Object> get props => [];
}

class change_mode_Initial extends changemodeState {}

class ChangeAppMode extends changemodeState {}
class ChangeAppModeLoading extends changemodeState {}
