import 'package:dio/dio.dart';

class TezdaInterceptor extends Interceptor {
  final String? authToken;
  TezdaInterceptor(this.authToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer ${authToken!}",
      });
    }
    return super.onRequest(options, handler);
  }

  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   ///Perform general action based on response
  //   ///
  //   return super.onResponse(response, handler);
  // }
}
