
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/data/repos/weather_base_repo.dart';
import 'package:weather_app/app/presentation/controller/states/currentweather_state.dart';


class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit(this.homeRepo) : super(current_weather_Initial());
  static CurrentWeatherCubit get(context) => BlocProvider.of(context);

  final HomeRepoBase homeRepo;
  Future<void> fetch_Current_Weather(String city) async {
    emit(current_weather_Loading());
    print("lllllllllllllllllllllllloading current weather");

    var result = await homeRepo.getCurrentWeather(city);
    result.fold((failure) {
      emit(current_weather_Failure(failure.errMessage));


      print("errrorrrrrrrrrrrrrrrrrrrrrrr current weather");
      print(failure.errMessage);

    }, (current_weather) {
      emit(current_weather_Success(current_weather));
      print("sucesssss current weather");

    });
  }
}