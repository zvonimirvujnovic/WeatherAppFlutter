import 'package:WeatherAppFlutterVujnovic/api_helper/api_helper.dart';
import 'package:WeatherAppFlutterVujnovic/api_helper/error_model.dart';
import 'package:WeatherAppFlutterVujnovic/initializer.dart';
import 'package:WeatherAppFlutterVujnovic/models/weather_info.dart';
import 'package:WeatherAppFlutterVujnovic/widgets/popup_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  BuildContext context;

  WeatherCubit(this.context) : super(WeatherInitial());

  final ApiHelper _apiHelper = Initializer.getIt.get<ApiHelper>();

  Future getTodaysWeather(String city) async {
    showLoadingIndicator(context);

    if (city.isEmpty) {
      emit(WeatherEmpty(ErrorModel(ErrorEnum.EMPTY_TEXT)));
      dismissDialog(context);
      return;
    }

    var response = await _apiHelper.getTodaysWeather(city);
    dismissDialog(context);

    if (response is ErrorModel) {
      emit(WeatherEmpty(response));
    } else {
      emit(WeatherLoaded(WeatherInfo.fromWeatherResponse(response)));
    }
  }
}
