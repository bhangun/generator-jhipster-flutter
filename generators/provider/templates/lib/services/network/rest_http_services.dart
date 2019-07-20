import 'dart:io';
import 'dart:convert';
import 'package:f_logs/model/flog/flog.dart';
import 'package:http/http.dart' as http;
import 'package:<%= appsName %>/utils/endpoints.dart';

import '../config.dart';
import '../helper.dart';
import '../shared_preference_services.dart';
import 'network_exceptions.dart';


class RestHttpServices {
  // singleton object
  static final RestHttpServices _singleton = RestHttpServices._();

  // A private constructor. Allows us to create instances of RestClient
  // only from within the RestClient class itself.
  RestHttpServices._();

  // factory method to return the same object each time its needed
  factory RestHttpServices() => _singleton;

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
    //if (response.statusCode == 200 || response.statusCode == 201)
      return response.body;
    //else throw Exception(response.body);
  }



  /*Future<dynamic> post(String uri, String body) {
    print(uri+body);
    _fetchToken().then((token)=> _headers.addAll({'Authorization': 'Bearer $token'}))
        .catchError((e)=>FLog.error(text: e));
_headers.addAll({"Content-Type": "application/json"});
    print(_headers.toString());
    return http
        .post(Endpoints.baseUrl+uri, body: body,
        headers: _headers,
        encoding: Encoding.getByName('UTF8'))
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw NetworkException(message:"Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }*/



//
  restPut(String path, String payload, [bool auth = false]) async {
    final response = await http.put(API + path,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": "Bearer  ${await prefs("token")}"
        },
        body: payload,
        encoding: Encoding.getByName('UTF8'));

    if (response.statusCode == 200 || response.statusCode == 201)
      return response.body;
    else
      throw Exception('Failed to put');
  }

//
  restDelete(String path) async {
    final response = await http.delete(API + path, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      "Authorization": "Bearer  ${await prefs("token")}"
    });
    if (response.statusCode == 200)
      return response.body;
    else
      throw Exception('Failed to delete');
  }

}