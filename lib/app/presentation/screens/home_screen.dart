

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/app/presentation/controller/cubit/changemodes.dart';
import 'package:weather_app/app/presentation/controller/states/change_mode_states.dart';
import 'package:weather_app/app/presentation/controller/states/search_states.dart';
import 'package:weather_app/app/presentation/widgets/OtherCountries_widget.dart';
import 'package:weather_app/app/presentation/widgets/TodayState_widget.dart';
import 'package:weather_app/app/presentation/widgets/DaysForcast_widget.dart';
import 'package:weather_app/app/presentation/widgets/search_bar.dart';
import 'package:weather_app/core/utils/sharedPrefrence.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<changemodeCubit, changemodeState>(

        builder: (context,state){
      return  Scaffold(

      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
      IconButton(
   //   color: Colors.black,
      onPressed: () {
        bool isdark= CacheHelper.getData(key: 'isDark');

        print(isdark);
        changemodeCubit.get(context).changeAppMode(isdark: isdark,frombutton:true);
      },
      icon: Icon(Icons.brightness_4_outlined)),
      //Spacer(),
    /*  IconButton(
     // color: Colors.black,

      onPressed: () {
      },
      icon: Icon(Icons.list)),*/
    ],


    ),

    body: SingleChildScrollView(
    child: Column(
    children:   [
    Search(isDark: changemodeCubit.get(context).isDark),
    SizedBox(
    height:30 ,
    ),
    TodayState(),
    SizedBox(
    height:15 ,
    ),

    DaysForcast(),
    SizedBox(
    height:15 ,
    ),

    OtherCountries(),

    ],
    ),
    ));
    }
    );
  }
}
