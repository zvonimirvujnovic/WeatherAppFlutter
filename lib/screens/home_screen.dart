import 'package:WeatherAppFlutterVujnovic/cubits/text_cubit.dart';
import 'package:WeatherAppFlutterVujnovic/cubits/weather_cubit.dart';
import 'package:WeatherAppFlutterVujnovic/style/colors.dart';
import 'package:WeatherAppFlutterVujnovic/style/constants.dart';
import 'package:WeatherAppFlutterVujnovic/style/strings.dart';
import 'package:WeatherAppFlutterVujnovic/widgets/popup_widget.dart';
import 'package:WeatherAppFlutterVujnovic/widgets/weater_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget showClearTextIcon(bool isTextEmpty) {
      return Visibility(
        visible: isTextEmpty,
        child: IconButton(
          onPressed: () {
            BlocProvider.of<TextCubit>(context).textInputEmpty();
            context.read<TextCubit>().textController.clear();
          },
          icon: Icon(Icons.cancel),
          color: blue,
        ),
      );
    }

    void updateTextField(String value) {
      if (value.length > 0) {
        BlocProvider.of<TextCubit>(context).textInputNotEmpty();
      } else {
        BlocProvider.of<TextCubit>(context).textInputEmpty();
      }
    }

    Widget buildWeatherInfo() {
      return BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case WeatherLoaded:
              context.read<TextCubit>().removeFocus();
              return showCityWeatherInfo((state as WeatherLoaded).weatherInfo);
            case WeatherEmpty:
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  showTextDialog(
                      context, (state as WeatherEmpty).error.message));
          }
          return Container(width: 0.0, height: 0.0);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: light_blue,
        centerTitle: true,
        title: Text(appName, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: defaultMarginLeft,
          right: defaultMarginTop,
          bottom: defaultMarginBottom,
        ),
        child: Column(
          children: [
            heightBox40,
            TextFormField(
              cursorColor: light_blue,
              onChanged: updateTextField,
              controller: context.read<TextCubit>().textController,
              focusNode: context.read<TextCubit>().textFocusNode,
              decoration: InputDecoration(
                hintText: textFieldHint,
                hintStyle: TextStyle(color: hint_text_color),
                border: OutlineInputBorder(),
                prefixIcon: const Icon(
                  Icons.search,
                  color: blue,
                ),
                suffixIcon: BlocBuilder<TextCubit, TextState>(
                    builder: (context, state) {
                  return showClearTextIcon(
                      state is TextNotEmpty ? true : false);
                }),
              ),
            ),
            heightBox10,
            MaterialButton(
              color: light_blue,
              child: Text(
                textFieldSubmitButtonText,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                String city = context.read<TextCubit>().textController.text;
                context.read<WeatherCubit>().getTodaysWeather(city);
              },
            ),
            buildWeatherInfo(),
          ],
        ),
      ),
    );
  }
}
