import 'package:WeatherAppFlutterVujnovic/api_helper/api_helper.dart';
import 'package:get_it/get_it.dart';

class Initializer {
  static GetIt getIt = GetIt.instance;

  static void getServices() {
    getIt.registerFactory(() => ApiHelper());
  }
}
