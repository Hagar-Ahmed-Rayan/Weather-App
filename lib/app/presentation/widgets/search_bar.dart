

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/presentation/controller/cubit/search_cubit.dart';
import 'package:weather_app/app/presentation/controller/states/search_states.dart';
import 'package:weather_app/core/utils/consts.dart';
import 'package:weather_app/core/widgets/loading_screen.dart';

class Search extends StatelessWidget {
   const Search( {Key? key, required this.isDark}) : super(key: key);
   final bool isDark;
   @override
   Widget build(BuildContext context) {
     final TextEditingController searchcontroller = TextEditingController();
     bool isValidCity(String city) {
       // Implement your city validation logic here
       // For example, you can check if the city is not empty and contains only alphabetic characters
       if (city.isEmpty) {
         return false;
       }

       // Regular expression pattern to match only alphabetic characters
       final pattern = RegExp(r'^[a-zA-Z]+$');

       if (!pattern.hasMatch(city)) {
         return false;
       }

       // Additional validation rules if necessary

       return true;
     }
     void showErrorMessage(BuildContext context, String message) {
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text('Error'),
             content: Text(message),
             actions: [
               TextButton(
                 child: Text('OK'),
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
               ),
             ],
           );
         },
       );
     }
     return BlocBuilder<searchCubit, searchState>(
         builder: (context,state){
         //  if(state is search_sucess){
             return Center(
               child: Container(
                 width: MediaQuery.of(context).size.width * 0.9,
                 decoration: BoxDecoration(
                   border: Border.all(color: defualtColor), // Set the border color to the default app color
                   borderRadius: BorderRadius.circular(10),
                 ),

                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                     textAlign: TextAlign.left, // Align the text to the left
                     textDirection: TextDirection.ltr,
                     textInputAction: TextInputAction.search,
                     controller: searchcontroller,
                     onChanged: (value) {
                  //     String city = value;
                    //   searchcontroller.text = city;
                     },
                     onSubmitted: (value) {
                       String city = value.trim(); // Trim any leading/trailing whitespaces
                       if (isValidCity(city)) { // Check if the entered city is valid
                         searchcontroller.text = city;
                         searchCubit.get(context).updateWeather(context,searchcontroller.text);
                       }
                       else{
                         showErrorMessage( context, 'Error:enter a valid city name');
                        print( 'Error:enter a valid city name');
                       }
                     },
                     style: TextStyle(
                       color: isDark ? Colors.white : Colors.black,
                     ),
                     decoration: InputDecoration(

                       suffix: IconButton(
                           icon: Icon(Icons.search),
                           color: defualtColor, onPressed: () {
                         String city = searchcontroller.text.trim(); // Trim any leading/trailing whitespaces
                         if (isValidCity(city)) { // Check if the entered city is valid
                           searchcontroller.text = city;
                           searchCubit.get(context).updateWeather(context,searchcontroller.text);
                         }
                         else{
                           showErrorMessage( context, 'Error:enter a valid city name');
                           print( 'Error:enter a valid city name');
                         }


                       },
                         ),


                       hintStyle: TextStyle(
                         color: isDark ? Colors.white : Colors.black,

                     //    color: Colors.grey,
                       ),
                       hintText: 'Search'.toUpperCase(),
                      border: InputBorder.none,
                      /* border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                           color:defualtColor,
                         ),
                       ),*/
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                           color: defualtColor,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             );
         //  }

         //return const CustomLoadingIndicator();
         }


     );
   }
 }
