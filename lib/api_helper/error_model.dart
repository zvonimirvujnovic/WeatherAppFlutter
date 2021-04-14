import 'package:WeatherAppFlutterVujnovic/style/strings.dart';

enum ErrorEnum {
  NOT_AUTHORIZED,
  WRONG_API_REQUEST,
  API_CALLS_LIMIT,
  HTTP,
  UNKNOWN,
  EMPTY_TEXT
}

class ErrorModel {
  final ErrorEnum _errorEnum;
  String _message;
  String get message => _message;

  ErrorModel(this._errorEnum) {
    switch (_errorEnum) {
      case ErrorEnum.NOT_AUTHORIZED:
        _message = notAuthorized;
        break;
      case ErrorEnum.WRONG_API_REQUEST:
        _message = wrongApiRequest;
        break;
      case ErrorEnum.API_CALLS_LIMIT:
        _message = apiCallsLimit;
        break;
      case ErrorEnum.HTTP:
        _message = httpConnectionTimeout;
        break;
      case ErrorEnum.UNKNOWN:
        _message = unknownError;
        break;
      case ErrorEnum.EMPTY_TEXT:
        _message = emptyEditText;
        break;
    }
  }
}
