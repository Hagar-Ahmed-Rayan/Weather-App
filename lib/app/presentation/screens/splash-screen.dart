
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app/presentation/screens/home_screen.dart';
import 'package:weather_app/core/utils/shared-functions.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      navto(context, HomeScreen());
      //Navigator.pushReplacementNamed(context, '/weather_page');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,



        children: [
          Image(
            image: AssetImage('assets/images/cloudy.png'),
            height: 250,width: 250,
          ),
          const SizedBox(height: 40.0),
          Text(
            'Discover the Weather ',
            style: const TextStyle(
              fontSize: 24.0,color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'in Your City',
            style: const TextStyle(
              fontSize: 24.0,color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            'Get to Know your weather maps and  ',
            style: const TextStyle(
                fontSize: 14.0,color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'radar precipitation forecast',
            style: const TextStyle(
                fontSize: 14.0,color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    ));
  }
}
