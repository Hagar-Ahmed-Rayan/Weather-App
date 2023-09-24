

import 'package:weather_app/app/presentation/controller/cubit/otherCountries_Cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/data/repos/weather_base_repo.dart';
import 'package:weather_app/app/presentation/controller/cubit/currentWeather_cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/fivedayes_cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/otherCountries_Cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/otherCountries_Cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/otherCountries_Cubit.dart';
import 'package:weather_app/app/presentation/controller/states/currentweather_state.dart';
import 'package:weather_app/app/presentation/controller/states/fivedayes_state.dart';
import 'package:weather_app/app/presentation/controller/states/search_states.dart';


class searchCubit extends Cubit<searchState> {
  searchCubit() : super(search_Initial());
  var nameCity = TextEditingController() ;
  static searchCubit get(context) => BlocProvider.of(context);

  void updateWeather(BuildContext context,String city) async{
  //  print("serch country loading");
   // emit(search_Loading());
    final currentWeatherCubit = context.read<CurrentWeatherCubit>();
    final fiveDayesCubit = context.read<FiveDayesCubit>();
    final otherCubit = context.read<othercountriesCubit>();

    otherCubit.fetchOtherCountries();
    currentWeatherCubit.fetch_Current_Weather(city);
    fiveDayesCubit.FetchFiveDayes(city);
   // fetch_Current_Weather(city);
    //FetchFiveDayes(city);

    nameCity.clear();
    print("serch country sucess");

    emit(search_sucess());
  }
}


