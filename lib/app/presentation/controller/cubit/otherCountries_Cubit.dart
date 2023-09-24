
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';
import 'package:weather_app/app/data/repos/weather_base_repo.dart';
import 'package:weather_app/app/presentation/controller/states/OtherCountries_states.dart';

class othercountriesCubit extends Cubit<othercountriesWeatherState> {
  othercountriesCubit(this.homeRepo) : super(othercountries_weather_Initial());
  static othercountriesCubit get(context) => BlocProvider.of(context);

  List<String> cities = [
    'paris',
    'England',
    'belgium',
    'Brazil',
    'Italy'
  ];
  List<TodayWeatherModel > dataList = [];
  final HomeRepoBase homeRepo;
  Future<void> fetchOtherCountries() async {

    cities.forEach((city) async {
    emit(othercountries_weather_Loading());
    print("lllllllllllllllllllllllloading other countries ");

      var result = await homeRepo.getCurrentWeather(city);
      result.fold((failure) {
        emit(othercountries_Failure(failure.errMessage));

        print("errrorrrrrrrrrrrrrrrrrrrrrrr other countries");
        print(failure.errMessage);
      }, (othercountries_weather) {
        print(othercountries_weather);
        print(othercountries_weather.name);
        print(othercountries_weather.clouds);
        dataList.add(othercountries_weather);

        emit(othercountries_Success(othercountries_weather));
        print("sucesssss other countries");
      });
      });
  }

}



