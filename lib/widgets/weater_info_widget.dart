import 'package:WeatherAppFlutterVujnovic/models/weather_info.dart';
import 'package:WeatherAppFlutterVujnovic/style/constants.dart';
import 'package:WeatherAppFlutterVujnovic/style/strings.dart';
import 'package:flutter/material.dart';

Widget showCityWeatherInfo(WeatherInfo weather) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: defaultMarginTop),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weatherDescription),
            Text(
              weather.weatherDescription,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            heightBox30,
            Text(currentTemperature),
            Text(
              weather.currentTemperature.toString() + " " +  celsius,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            heightBox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(minTemperature),
                Text(maxTemperature),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  weather.minTemperature.toString() + " " +  celsius,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  weather.maxTemperature.toString() + " " +  celsius,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            heightBox30,
            Text(pressure),
            Text(
              weather.pressure.toString() + " " +  hPa,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            heightBox30,
            Text(humidity),
            Text(
              weather.humidity.toString() + " " + percentage,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            heightBox30,
            Text(visibility),
            Text(
              weather.visibility.toString() + " " +  meter,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            heightBox30,
            Text(windSpeed),
            Text(
              weather.windSpeed.toString() + " " +  speedUnit,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            heightBox30,
            Text(measureLocation),
            Text(
              weather.measureLocation,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
