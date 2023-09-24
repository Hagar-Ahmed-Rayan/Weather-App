




  import 'package:equatable/equatable.dart';
import 'package:weather_app/app/data/models/fivedayes/FivedayesModel.dart';
import 'package:weather_app/app/data/models/fivedayes/List.dart';

  abstract class FiveDayesState extends Equatable {
  const FiveDayesState();

  @override
  List<Object> get props => [];
  }

  class five_dayes_Initial extends FiveDayesState {}

  class five_dayes_Loading extends FiveDayesState {}

  class five_dayes_Failure extends FiveDayesState {
  final String errorMessage;

  const five_dayes_Failure(this.errorMessage);
  }

  class five_dayes_Success extends FiveDayesState {
  final List<fivedayesList> fivedayesModel;

  const five_dayes_Success(this.fivedayesModel);
  }