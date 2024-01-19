import 'package:dio/dio.dart';

class ApiError {
  late String message;
  late final String? description;
  late num statusCode;
  dynamic data;

  ApiError(this.message, [this.description]);

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioException) {
      DioException dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          message = "Request to server was cancelled";
          break;
        case DioExceptionType.connectionError:
          message = "Connection Error";
          break;
        case DioExceptionType.connectionTimeout:
          message =
              "Connection timeout with API server, please try again later";
          break;
        case DioExceptionType.unknown:
          message =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
        case DioExceptionType.receiveTimeout:
          message =
              "Receive timeout in connection with API server, please try again later.";
          break;
        case DioExceptionType.badCertificate:
          message = "Bad Certificate, please try again later.";
          break;
        case DioExceptionType.badResponse:
          message = "An Unknown error occurred. "
              "We are currently working on it";
          statusCode = dioError.response?.statusCode ?? 500;
          final response = error.response;
          if (response == null) return;
          if (statusCode < 500) {
            List<String> messages = [];
            try {
              Map errorStatements = response.data['errors'] ??
                  response.data['title'] ??
                  response.data["message"];
              for (var error in errorStatements.keys) {
                if (errorStatements[error] is String) {
                  errorStatements[error] = errorStatements[error].split(':');
                }
                for (var err in errorStatements[error]) {
                  messages.add(err);
                }
              }
            } catch (e) {
              messages.add(response.data['title'] ?? response.data['message']);
            }
            message = messages.join(',');
            // try {
            //   bool displayMessage = response.data["message"] is String &&
            //       response.data["message"] != '';
            //   if (displayMessage) {
            //     message = response.data["message"];
            //   } else {
            //     message = (response.data["message"] as Map).values.first[0];
            //   }
            //   data = response.data["data"];
            // } catch (_) {}
          }
          break;
        case DioExceptionType.sendTimeout:
          message =
              "Connection timeout with API server, please try again later";
          break;
      }
    } else {
      message = "An unknown error occurred!";
    }
  }

  @override
  String toString() => message;
}
