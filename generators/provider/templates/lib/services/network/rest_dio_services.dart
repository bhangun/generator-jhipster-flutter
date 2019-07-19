import 'package:dio/dio.dart';
import 'package:jh_flutter_provider/services/shared_preference_services.dart';
import 'package:jh_flutter_provider/utils/endpoints.dart';


class RestDioServices {

  static Dio dio = Dio()
    ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = 5000
    ..options.receiveTimeout = 3000
    ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
      // getting shared pref instance
      var prefs = await SharedPrefServices.instance;

      // getting token
      var token = prefs.authToken;

      if (token != null) {
        print('>>>>>>>>>>>>>'+token);
        //options.headers.putIfAbsent('Authorization', () => token);
        options.headers = {'Authorization': 'Bearer $token'};

      } else {
        print('Auth token is null');
      }
    }));


  // Get:-----------------------------------------------------------------------
   Future<dynamic> fetch(String uri) async {
    try {
      final Response response = await dio.get(uri);
      return response.data;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
   Future<dynamic> post(String uri, dynamic data) async {
    try {
      final Response response = await dio.post(uri, data: data);
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> delete(String uri, dynamic data) async {
    try {
      final Response response = await dio.delete(uri, data: data);
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await dio.put(uri, data: data);
      return response.data;
    } catch (e) {
      throw e;
    }
  }

}
