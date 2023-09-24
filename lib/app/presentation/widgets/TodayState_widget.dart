import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/presentation/controller/cubit/currentWeather_cubit.dart';
import 'package:weather_app/app/presentation/controller/states/currentweather_state.dart';
import 'package:weather_app/core/utils/ImagePath_function.dart';
import 'package:weather_app/core/widgets/error_screen.dart';
import 'package:weather_app/core/widgets/loading_screen.dart';

class TodayState extends StatelessWidget {
  const TodayState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      builder: (context,state){
        if (state is current_weather_Success) {
          return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(


              width: 420,
              height: 240 ,

              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.orange,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [

                    Center(
                      child: Text(
                          state.todayWeatherModel!.name!,
                          style: Theme.of(context).textTheme.bodyText1
                      ),
                    ),
                    Center(
                      child: Text(
                          DateFormat()
                              .add_MMMMEEEEd()
                              .format(
                              DateTime.now()),
                          style:
                          Theme.of(context).textTheme.bodyText1

                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color:Colors.orange ,
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        state.todayWeatherModel!.weather![0].description!.toUpperCase(),
                                        style: Theme.of(context).textTheme.headline5,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    //  SizedBox(height: 30),
                                      Text(
                                        ('${(state.todayWeatherModel!.main!.temp! .round()-273).toString()}\u2103'),
                                        style: Theme.of(context).textTheme.headline5,
                                      ),
                                  //    SizedBox(height: 36),
                                      Text(
                                        'min: ${(state.todayWeatherModel.main!.tempMin! - 273.15).round().toString()}\u2103 ',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      Text(
                                        ' max: ${(state.todayWeatherModel.main!.tempMax! - 273.15).round().toString()}\u2103',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.13,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(getUrl(state.todayWeatherModel!.weather![0].description!)),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        '${state.todayWeatherModel!.wind!.speed} m/s',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
        }
        else if (state is current_weather_Failure)
          return CustomErrorWidget( errorMessage: state.errorMessage,);
        else
        return const CustomLoadingIndicator();


      },

    );
  }
}
