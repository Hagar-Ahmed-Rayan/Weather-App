import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/data/models/TodayWeatherModel.dart';
import 'package:weather_app/core/utils/ImagePath_function.dart';


class List_OtherCountries_item extends StatelessWidget {
  const List_OtherCountries_item({Key? key, required this.countryitem}) : super(key: key);
  final TodayWeatherModel countryitem;
  @override
  Widget build(BuildContext context) {
    return Container(


    width: 150,
    height: 100 ,

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
        countryitem?.name??'city name',
   // 'city name',
    style: Theme.of(context).textTheme.bodyText1
    ),
    ),
      SizedBox(height: 2),

      Text(
        '${(countryitem.main!.temp !- 273.15).round().toString()}\u2103',
         // '28 C',

          style:
          TextStyle(fontSize: 20),

          //Theme.of(context).textTheme.headline5

      ),



    SizedBox(height: 2),
      Container(
        width:25,
        height:25,

        // width: 50,
        //height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(getUrl( countryitem.weather![0].description! )),
            fit: BoxFit.cover,
          ),
        ),
      ),

      FittedBox( //make the text fit its space by making font size smaller
        fit: BoxFit.scaleDown,
        child: Text(
          countryitem!.weather![0].description as String,
          style: Theme.of(context).textTheme.bodyText1,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
  /*  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    width: 25,
    height: 25,

    // width: 50,
    //height: 50,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://uxwing.com/wp-content/themes/uxwing/download/weather/weather-icon.png'),
    fit: BoxFit.cover,
    ),
    ),
    ),
    ),


      Text(

        'clear sky',

        style:
            TextStyle(fontSize: 20),
       // Theme.of(context).textTheme.headline5,

        maxLines: 1,

        overflow: TextOverflow.ellipsis,

      ),*/

    ],
    ),
    )
    );

  }
}
