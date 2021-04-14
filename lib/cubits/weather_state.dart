part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherInfo weatherInfo;
  const WeatherLoaded(this.weatherInfo);
}

class WeatherEmpty extends WeatherState {
  final ErrorModel error;
  const WeatherEmpty(this.error);
}
