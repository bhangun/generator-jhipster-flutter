import 'dart:convert';
import 'package:f_logs/model/flog/flog.dart';
import 'package:http/http.dart' as http;

import 'package:<%= appsName %>/utils/endpoints.dart';
import '../../utils/config.dart';
import '../shared_preference_services.dart';
import 'network_exceptions.dart';


class RestHttpServices {
  // singleton object
  static final RestHttpServices _singleton = RestHttpServices._();

  // A private constructor. Allows us to create instances of RestClient
  // only from within the RestClient class itself.
  RestHttpServices._();

  // factory method to return the same object each time its needed
  factory RestHttpServices() =>  _singleton;

  // Singleton accessor
  static RestHttpServices get instance => RestHttpServices();

  var _headers={"Content-Type": "application/json"};

  Future _fetchToken() async{
    var prefs = await SharedPrefServices.instance;

    // getting token
    return prefs.authToken;
  }

  // Get:-----------------------------------------------------------------------
  Future fetch(String uri) async {

    _fetchToken().then((token)=> _headers.addAll({'Authorization': 'Bearer $token'}))
        .catchError((e)=>FLog.error(text: e));

    return http.get(Endpoints.baseUrl+uri,headers: _headers ).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw NetworkException(message:"Error fetching data from server", statusCode: statusCode);
      }
      return res;
    });
  }

  // Post:----------------------------------------------------------------------
  Future post(String uri, dynamic data) async {
    _fetchToken().then((token)=> _headers.addAll({'Authorization': 'Bearer $token'}))
        .catchError((e)=>FLog.error(text: e));

    final response = await http.post(Endpoints.baseUrl+uri,
        headers: _headers,
        body: data,
        encoding: Encoding.getByName('UTF8'));
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw NetworkException(message:"Error post data to server", statusCode: statusCode);
    }
    return res;
  }

//
  put(String path, String payload, [bool auth = false]) async {
    _fetchToken().then((token)=> _headers.addAll({'Authorization': 'Bearer $token'}))
        .catchError((e)=>FLog.error(text: e));

    final response = await http.put(API + path,
        headers: _headers,
        body: payload,
        encoding: Encoding.getByName('UTF8'));

    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw NetworkException(message:"Error put data ", statusCode: statusCode);
    }
    return res;
  }

//
  delete(String path) async {
    _fetchToken().then((token)=> _headers.addAll({'Authorization': 'Bearer $token'}))
        .catchError((e)=>FLog.error(text: e));

    final response = await http.delete(API + path,
        headers: _headers);

    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw NetworkException(message:"Error delet data on server", statusCode: statusCode);
    }
    return res;
  }

}