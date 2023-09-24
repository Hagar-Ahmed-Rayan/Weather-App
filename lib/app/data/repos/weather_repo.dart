import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';
import 'package:weather_app/app/data/models/fivedayes/FivedayesModel.dart';
import 'package:weather_app/app/data/models/fivedayes/List.dart';
import 'package:weather_app/app/data/repos/weather_base_repo.dart';
import 'package:weather_app/core/errors/fail.dart';

class HomeRepoImpl implements HomeRepoBase {
  String  apiKey ='022382a22ba8ae07c58d796d9bb597b8';
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
//https://api.openweathermap.org/data/2.5/weather?q=Cairo&appid=022382a22ba8ae07c58d796d9bb597b8
  @override
  Future<Either<Failure, TodayWeatherModel>> getCurrentWeather(String city) async {

    //String today_weather = "$baseUrl/weather?q=$city&lang=en&$apiKey";
    String today_weather = "$baseUrl/weather?q=$city&lang=en&appid=$apiKey";

    try {
      final response = await Dio().get(today_weather);
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyesssssssssssss current");
      print(response);
      var  todayWeather=TodayWeatherModel.fromJson(response.data);
      TodayWeatherModel  todayWeatherModel=TodayWeatherModel.fromJson(response.data);
      print(todayWeatherModel);



      return Right(todayWeatherModel);
    } catch (e) {
      if (e is DioError) {
        print("nooooooooooooooooooooooooooo current");

        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  @override

  Future<Either<Failure, List<fivedayesList>>> getFiveDaysForcast(String city) async {
    String fivedayes='$baseUrl/forecast?q=$city&lang=en&appid=$apiKey';
    //String today_weather = "$baseUrl/weather?q=$city&lang=en&$apiKey";
//    String today_weather = "$baseUrl/weather?q=$city&lang=en&appid=$apiKey";
 List<fivedayesList> listofdays = [];
//
//       for (var item in response.data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
    try {
      final response = await Dio().get(fivedayes);
      print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyesssssssssssss 5dayes");
      print(response);
      print("/////////////////////////////////////////");
      print(response.data['list']);
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&7");
      print(response.data['list'][0]);
print("*****************************88");
      for (var item in response.data['list']) {
        print(item);
        print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5");
        listofdays.add(fivedayesList.fromJson(item));
   }
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

      print(listofdays.length);
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!");

      print(listofdays[0].dt);

      //   var  todayWeather=TodayWeatherModel.fromJson(response.data);
    //  print("hagarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrbtgrb");
    //  print(todayWeather);
      FivedayesModel  fivedayesModelModel=FivedayesModel.fromJson(response.data);
     // print("hagarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr 5 dayes");
     // print(fivedayesModelModel);



      return Right(listofdays);
    } catch (e) {
      if (e is DioError) {
        print("nooooooooooooooooooooooooooo 5 dayes");

        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }


}