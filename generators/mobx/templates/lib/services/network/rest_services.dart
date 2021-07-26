import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:kutilang_example/utils/config.dart';

import '../auth_jwt_services.dart';
import 'rest_error_util.dart';

class RestServices {
  static Dio _dio = Dio()
    ..options.baseUrl = API
    ..options.connectTimeout = TIMEOUT_CONNECTION
    ..options.receiveTimeout = TIMEOUT_RECEIVE
    ..interceptors.clear()
    ..interceptors.add(LogInterceptor(
        requestBody: false,
        request: false,
        requestHeader: false,
        responseHeader: false,
        responseBody: true))
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler requestHandler) async {
         // String token = await 
          AuthServices.fetchToken().then((token) => 
          {if (token != '') options.headers["Authorization"] = "Bearer " + token});

          requestHandler.next(options);
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler responseHandler) =>
                {responseHandler.next(e)},
        onError: (DioError error, ErrorInterceptorHandler errorHandler) {
          FLog.error(text: DioErrorUtil.handleError(error));
          // Do something with response error
          if (error.response?.statusCode == 403) {
            // requestLock.lock()-> If no token, request token firstly and lock this interceptor
            // to prevent other request enter this interceptor.
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();
          }
          errorHandler.next(error);
        }));

  // GET
  static Future<dynamic> fetch(String uri) async {
    Response response = await _dio.get(uri);
    return response.data;
  }

  // POST
  static Future<dynamic> post(String uri, dynamic data) async {
    Object response = await _dio
        .post(uri, data: data)
        .then((value) => value.data)
        .onError((error, stackTrace) => error.toString());
    return response;
  }

  // DELETE
  static Future<dynamic> delete(String uri, dynamic id) async {
    Response response = await _dio.delete(uri, data: id);
    return response.data;
  }

  // PUT
  static Future<dynamic> put(String uri, dynamic data) async {
    Response response = await _dio.put(uri, data: data);
    return response.data;
  }
}
