import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/data/repos/weather_repo.dart';
import 'package:weather_app/app/presentation/controller/cubit/changemodes.dart';
import 'package:weather_app/app/presentation/controller/cubit/currentWeather_cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/fivedayes_cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/otherCountries_Cubit.dart';
import 'package:weather_app/app/presentation/controller/cubit/search_cubit.dart';
import 'package:weather_app/app/presentation/controller/states/change_mode_states.dart';
import 'package:weather_app/app/presentation/screens/splash-screen.dart';
import 'package:weather_app/core/utils/service_locator.dart';
import 'package:weather_app/core/utils/sharedPrefrence.dart';
import 'package:weather_app/core/utils/themes.dart';

void main() async {

  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  BlocOverrides.runZoned(
        () {
      bool? isDark = CacheHelper.getData(key: 'isDark');
      print("is darkkkkkk here");
      print(isDark);

      runApp(MyApp(isDark: isDark,));
    },
  );
 // bool? isDark = CacheHelper.getData(key: 'isDark');

 // runApp(MyApp(isDark: isDark,));
 // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  bool? isDark;


 // MyApp({ this.isDark});
   MyApp({super.key,this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (context) => CurrentWeatherCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetch_Current_Weather('cairo')

    ),
        BlocProvider(
            create: (context) => FiveDayesCubit(
              getIt.get<HomeRepoImpl>(),
            )..FetchFiveDayes('cairo')

        ),

        BlocProvider(
            create: (context) => othercountriesCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchOtherCountries()

        ),
        BlocProvider(
            create: (context) => searchCubit()

        ),
        BlocProvider(
            create: (context) => changemodeCubit()..changeAppMode(isdark: isDark)

        ),
      ],
   child: BlocConsumer <changemodeCubit, changemodeState>(
        listener: (context, state) {},
        builder: (context, state) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: lightTheme,
        darkTheme: darkTheme,
        title: 'weather app',
        themeMode:
        // ThemeMode.light,
        changemodeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        /*theme: ThemeData(

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),*/
        home: Splash_screen(),
      );
  }
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
