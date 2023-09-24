import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/data/repos/weather_repo.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
 // getIt.registerSingleton<ApiConstance>(ApiConstance());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(

  ));
}