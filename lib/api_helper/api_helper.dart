import 'dart:convert';
import 'dart:io';

import 'package:WeatherAppFlutterVujnovic/api_helper/error_model.dart';
import 'package:WeatherAppFlutterVujnovic/config/weather_api_config.dart';
import 'package:WeatherAppFlutterVujnovic/models/weather_response.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<dynamic> _makeGetRequest({String endpoint, Map<String, String> queryParams}) async {
    try {
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = WeatherApiConfig.BASE_URL + endpoint + '?' + queryString;
      return await http.get(requestUrl);
    } catch (exc) {
      if (exc is SocketException) {
        return ErrorModel(ErrorEnum.HTTP);
      } else {
        return ErrorModel(ErrorEnum.UNKNOWN);
      }
    }
  }

  Future<dynamic> getTodaysWeather(String city) async {
    Map<String, String> queryParams = {
      "q": city,
      "appid": WeatherApiConfig.API_KEY,
      "units": WeatherApiConfig.UNITS
    };
    var response = await _makeGetRequest(endpoint: "/weather", queryParams: queryParams);

    if (response is http.Response) {
      switch (response.statusCode) {
        case 200:
          return WeatherResponse.fromJson(json.decode(response.body));
        case 401:
          return ErrorModel(ErrorEnum.API_CALLS_LIMIT);
        case 404:
          return ErrorModel(ErrorEnum.WRONG_API_REQUEST);
        case 429:
          return ErrorModel(ErrorEnum.API_CALLS_LIMIT);
        default:
          return ErrorModel(ErrorEnum.UNKNOWN);
      }
    }

    return response;
  }
}
