import 'package:WeatherAppFlutterVujnovic/cubits/text_cubit.dart';
import 'package:WeatherAppFlutterVujnovic/cubits/weather_cubit.dart';
import 'package:WeatherAppFlutterVujnovic/initializer.dart';
import 'package:WeatherAppFlutterVujnovic/screens/home_screen.dart';
import 'package:WeatherAppFlutterVujnovic/style/colors.dart';
import 'package:WeatherAppFlutterVujnovic/style/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Initializer.getServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(primaryColor: light_blue),
      home: getHomePage(),
    );
  }
}

Widget getHomePage() {
  return MultiBlocProvider(
    child: HomeScreen(),
    providers: [
      BlocProvider(
        create: (context) => WeatherCubit(context),
      ),
      BlocProvider(
        create: (context) => TextCubit(),
      ),
    ],
  );
}
