
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/presentation/controller/cubit/otherCountries_Cubit.dart';
import 'package:weather_app/app/presentation/controller/states/OtherCountries_states.dart';
import 'package:weather_app/app/presentation/widgets/List_Forcast_item.dart';
import 'package:weather_app/app/presentation/widgets/List_OtherCountries_item.dart';
import 'package:weather_app/core/widgets/error_screen.dart';
import 'package:weather_app/core/widgets/loading_screen.dart';
class OtherCountries extends StatelessWidget {
  const OtherCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<othercountriesCubit, othercountriesWeatherState>(
        builder: (context,state){
          if(state is othercountries_Success)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //   width: 420,
                height: 200 ,

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
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                                'Other Countries',
                                style: Theme.of(context).textTheme.bodyText1
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.orange ,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Expanded(
                            child: ListView.builder(
                              //  physics:NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: othercountriesCubit.get(context).dataList.length,
                                itemBuilder: (context, index) {
                                  return
                                    //Text('data');
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical:0 ,horizontal:5 ),
                                      child: List_OtherCountries_item( countryitem:othercountriesCubit.get(context).dataList[index],),
                                    );
                                }
                            ),
                          ),
                        ),




                      ]),),
              ),
            );
          else if (state is othercountries_Failure)
            return CustomErrorWidget( errorMessage: state.errorMessage,);
          else
            return const CustomLoadingIndicator();
        }

    );
  }
}
