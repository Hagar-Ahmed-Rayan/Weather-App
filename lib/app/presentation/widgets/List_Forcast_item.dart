

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/data/models/fivedayes/List.dart';
import 'package:weather_app/core/utils/ImagePath_function.dart';

class List_Forcast_item extends StatelessWidget {
  const List_Forcast_item({Key? key, required this.fivedayesitem, required this.duration}) : super(key: key);
final fivedayesList fivedayesitem;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
                DateFormat.E().format(DateTime.now().add(duration )),
           //    (fivedayesitem.dtTxt).toString() ,//day
           //     'Tuesday',
                style:
                Theme.of(context).textTheme.bodyText1
            ),

            Text(
              //   ('${(state.todayWeatherModel!.main!.temp! .round()-273).toString()}\u2103'),
                '${(fivedayesitem!.main!.temp!.round()-273).toString()}\u2103'
              //  '24 C'
                    ,
                style:
                Theme.of(context).textTheme.bodyText1
            ),
            Container(
              width:25,
              height:25,

              // width: 50,
              //height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getUrl( fivedayesitem.weather![0].description! )),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text(
    //            '12:00AM '
                fivedayesitem!.weather![0].description as String,

                style:
                Theme.of(context).textTheme.bodyText1
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
      border: Border(
    bottom: BorderSide(
    color: Colors.orange,
    width: 1.0,
    ),
    ),
      ),
    );
  }
}
