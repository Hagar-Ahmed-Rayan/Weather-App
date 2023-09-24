


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/data/repos/weather_base_repo.dart';
import 'package:weather_app/app/presentation/controller/states/change_mode_states.dart';
import 'package:weather_app/app/presentation/controller/states/currentweather_state.dart';
import 'package:weather_app/core/utils/sharedPrefrence.dart';


class changemodeCubit extends Cubit<changemodeState> {
  changemodeCubit() : super(change_mode_Initial());
  static changemodeCubit get(context) => BlocProvider.of(context);
  bool isDark= false;
  void changeAppMode({ required bool? isdark,bool? frombutton}) {
    if (isdark == null) { //first time only
      print("herrrrrrrrrrrr 1");
      isDark=false;
      CacheHelper.putBoolean(key: 'isDark', value: false).then((value) {
        emit(ChangeAppMode());
      });
    }
    else if (isdark != null&&frombutton==true){ //if call from button
      print("herrrrrrrrrrrr 2");


      isdark = !isdark;
      isDark=isdark;
      emit(ChangeAppModeLoading());

      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {

        emit(ChangeAppMode());
      });
    }
   else if (isdark != null) { //if call from main
      print("herrrrrrrrrrrr 3");
      isDark = isdark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode());
      });

    }
  }
}

