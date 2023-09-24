
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/data/repos/weather_base_repo.dart';
import 'package:weather_app/app/presentation/controller/states/currentweather_state.dart';
import 'package:weather_app/app/presentation/controller/states/fivedayes_state.dart';


class FiveDayesCubit extends Cubit<FiveDayesState> {
  FiveDayesCubit(this.homeRepo) : super(five_dayes_Initial());
  static FiveDayesCubit get(context) => BlocProvider.of(context);
  final HomeRepoBase homeRepo;
  Future<void> FetchFiveDayes(String city) async {
    print("fetch five dayes");


    emit(five_dayes_Loading());
    print("lllllllllllllllllllllllloading five dayes");

    var result = await homeRepo.getFiveDaysForcast(city);
    result.fold((failure) {
      emit(five_dayes_Failure(failure.errMessage));

      print("errrorrrrrrrrrrrrrrrrrrrrrrr five dayes");
      print(failure.errMessage);

    }, (five_dayes) {
      emit(five_dayes_Success(five_dayes));
      print("sucesssss five_dayes");

    });
  }
}