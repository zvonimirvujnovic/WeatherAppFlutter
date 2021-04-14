/// coord : {"lon":15.9775,"lat":45.8131}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]
/// base : "stations"
/// main : {"temp":286.54,"feels_like":286.08,"temp_min":286.15,"temp_max":287.15,"pressure":1016,"humidity":82}
/// visibility : 10000
/// wind : {"speed":1.54,"deg":340}
/// clouds : {"all":0}
/// dt : 1618234506
/// sys : {"type":1,"id":6389,"country":"HR","sunrise":1618200920,"sunset":1618249076}
/// timezone : 7200
/// id : 6618983
/// name : "Donji grad"
/// cod : 200

class WeatherResponse {
  Coord _coord;
  List<Weather> _weather;
  String _base;
  Main _main;
  int _visibility;
  Wind _wind;
  Clouds _clouds;
  int _dt;
  Sys _sys;
  int _timezone;
  int _id;
  String _name;
  int _cod;

  Coord get coord => _coord;
  List<Weather> get weather => _weather;
  String get base => _base;
  Main get main => _main;
  int get visibility => _visibility;
  Wind get wind => _wind;
  Clouds get clouds => _clouds;
  int get dt => _dt;
  Sys get sys => _sys;
  int get timezone => _timezone;
  int get id => _id;
  String get name => _name;
  int get cod => _cod;

  WeatherResponse(
      {Coord coord,
      List<Weather> weather,
      String base,
      Main main,
      int visibility,
      Wind wind,
      Clouds clouds,
      int dt,
      Sys sys,
      int timezone,
      int id,
      String name,
      int cod}) {
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  WeatherResponse.fromJson(dynamic json) {
    _coord = json["coord"] != null ? Coord.fromJson(json["coord"]) : null;
    if (json["weather"] != null) {
      _weather = [];
      json["weather"].forEach((v) {
        _weather.add(Weather.fromJson(v));
      });
    }
    _base = json["base"];
    _main = json["main"] != null ? Main.fromJson(json["main"]) : null;
    _visibility = json["visibility"];
    _wind = json["wind"] != null ? Wind.fromJson(json["wind"]) : null;
    _clouds = json["clouds"] != null ? Clouds.fromJson(json["clouds"]) : null;
    _dt = json["dt"];
    _sys = json["sys"] != null ? Sys.fromJson(json["sys"]) : null;
    _timezone = json["timezone"];
    _id = json["id"];
    _name = json["name"];
    _cod = json["cod"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_coord != null) {
      map["coord"] = _coord.toJson();
    }
    if (_weather != null) {
      map["weather"] = _weather.map((v) => v.toJson()).toList();
    }
    map["base"] = _base;
    if (_main != null) {
      map["main"] = _main.toJson();
    }
    map["visibility"] = _visibility;
    if (_wind != null) {
      map["wind"] = _wind.toJson();
    }
    if (_clouds != null) {
      map["clouds"] = _clouds.toJson();
    }
    map["dt"] = _dt;
    if (_sys != null) {
      map["sys"] = _sys.toJson();
    }
    map["timezone"] = _timezone;
    map["id"] = _id;
    map["name"] = _name;
    map["cod"] = _cod;
    return map;
  }
}

/// type : 1
/// id : 6389
/// country : "HR"
/// sunrise : 1618200920
/// sunset : 1618249076

class Sys {
  int _type;
  int _id;
  String _country;
  int _sunrise;
  int _sunset;

  int get type => _type;
  int get id => _id;
  String get country => _country;
  int get sunrise => _sunrise;
  int get sunset => _sunset;

  Sys({int type, int id, String country, int sunrise, int sunset}) {
    _type = type;
    _id = id;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _type = json["type"];
    _id = json["id"];
    _country = json["country"];
    _sunrise = json["sunrise"];
    _sunset = json["sunset"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["id"] = _id;
    map["country"] = _country;
    map["sunrise"] = _sunrise;
    map["sunset"] = _sunset;
    return map;
  }
}

/// all : 0

class Clouds {
  int _all;

  int get all => _all;

  Clouds({int all}) {
    _all = all;
  }

  Clouds.fromJson(dynamic json) {
    _all = json["all"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["all"] = _all;
    return map;
  }
}

/// speed : 1.54
/// deg : 340

class Wind {
  double _speed;
  int _deg;

  double get speed => _speed;
  int get deg => _deg;

  Wind({double speed, int deg}) {
    _speed = speed;
    _deg = deg;
  }

  Wind.fromJson(dynamic json) {
    _speed = json["speed"].toDouble();
    _deg = json["deg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["speed"] = _speed;
    map["deg"] = _deg;
    return map;
  }
}

/// temp : 286.54
/// feels_like : 286.08
/// temp_min : 286.15
/// temp_max : 287.15
/// pressure : 1016
/// humidity : 82

class Main {
  double _temp;
  double _feelsLike;
  double _tempMin;
  double _tempMax;
  int _pressure;
  int _humidity;

  double get temp => _temp;
  double get feelsLike => _feelsLike;
  double get tempMin => _tempMin;
  double get tempMax => _tempMax;
  int get pressure => _pressure;
  int get humidity => _humidity;

  Main({double temp, double feelsLike, double tempMin, double tempMax, int pressure, int humidity}) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
  }

  Main.fromJson(dynamic json) {
    _temp = json["temp"] as double;
    _feelsLike = json["feels_like"].toDouble();
    _tempMin = json["temp_min"].toDouble();
    _tempMax = json["temp_max"].toDouble();
    _pressure = json["pressure"];
    _humidity = json["humidity"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["temp"] = _temp;
    map["feels_like"] = _feelsLike;
    map["temp_min"] = _tempMin;
    map["temp_max"] = _tempMax;
    map["pressure"] = _pressure;
    map["humidity"] = _humidity;
    return map;
  }
}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

class Weather {
  int _id;
  String _main;
  String _description;
  String _icon;

  int get id => _id;
  String get main => _main;
  String get description => _description;
  String get icon => _icon;

  Weather({int id, String main, String description, String icon}) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _id = json["id"];
    _main = json["main"];
    _description = json["description"];
    _icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["main"] = _main;
    map["description"] = _description;
    map["icon"] = _icon;
    return map;
  }
}

/// lon : 15.9775
/// lat : 45.8131

class Coord {
  double _lon;
  double _lat;

  double get lon => _lon;
  double get lat => _lat;

  Coord({double lon, double lat}) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json["lon"].toDouble();
    _lat = json["lat"].toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lon"] = _lon;
    map["lat"] = _lat;
    return map;
  }
}
