import 'package:either_dart/either.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';
import 'package:weather_app/app/data/models/fivedayes/FivedayesModel.dart';
import 'package:weather_app/app/data/models/fivedayes/List.dart';
import 'package:weather_app/core/errors/fail.dart';

abstract class HomeRepoBase {
  Future<Either<Failure, TodayWeatherModel>> getCurrentWeather(String city);
  Future<Either<Failure,List<fivedayesList> >> getFiveDaysForcast(String city);

}