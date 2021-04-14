import 'package:WeatherAppFlutterVujnovic/models/weather_response.dart';

class WeatherInfo {
  final String weatherDescription;
  final double currentTemperature;
  final double minTemperature;
  final double maxTemperature;
  final int pressure;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final String measureLocation;

  WeatherInfo(
    this.weatherDescription,
    this.currentTemperature,
    this.minTemperature,
    this.maxTemperature,
    this.pressure,
    this.humidity,
    this.visibility,
    this.windSpeed,
    this.measureLocation,
  );

  static WeatherInfo fromWeatherResponse(WeatherResponse weatherResponse) {
    return WeatherInfo(
      weatherResponse.weather[0].description,
      weatherResponse.main.temp,
      weatherResponse.main.tempMin,
      weatherResponse.main.tempMax,
      weatherResponse.main.pressure,
      weatherResponse.main.humidity,
      weatherResponse.visibility,
      weatherResponse.wind.speed,
      weatherResponse.name,
    );
  }
}
