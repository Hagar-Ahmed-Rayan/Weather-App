import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/presentation/controller/cubit/fivedayes_cubit.dart';
import 'package:weather_app/app/presentation/controller/states/fivedayes_state.dart';
import 'package:weather_app/app/presentation/widgets/List_Forcast_item.dart';
import 'package:weather_app/core/widgets/error_screen.dart';
import 'package:weather_app/core/widgets/loading_screen.dart';



class DaysForcast extends StatelessWidget {
  const DaysForcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<FiveDayesCubit, FiveDayesState>(
      builder: (context,state){
        if(state is five_dayes_Success)
         return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 420,
              height: 250 ,

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
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                              '5 Day Forcast',
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.orange ,
                        thickness: 2,
                      ),

                      Container(
                        child: Expanded(
                          child: ListView.builder(
                              physics:NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.fivedayesModel.length,
                              itemBuilder: (context, index) {
                                return
                                  //Text('data');
                                  List_Forcast_item(fivedayesitem: state.fivedayesModel[index], duration: Duration(days: index+1));
                              }
                          ),
                        ),
                      ),




                    ]),),
            ),
          );
        else if (state is five_dayes_Failure)
          return CustomErrorWidget( errorMessage: state.errorMessage,);
        else
          return const CustomLoadingIndicator();

      }
    );


  }
}
