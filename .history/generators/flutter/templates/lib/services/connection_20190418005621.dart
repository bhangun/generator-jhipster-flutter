import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../administration/dashboard.dart';
import 'helper.dart';
import '../services/config.dart';

//
restGet(String path, [bool auth = false, bool isBasePath = false]) async {
  final response =
      await http.get(isBasePath ? BASE_URL + path : API + path, headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    "Authorization": "Bearer  ${(auth) ? await prefs("token") : ""}"
  });

  print(auth );
  if (response.statusCode == 200)
    // If the call to the server was successful, parse the JSON
    return response.body;
  else
    // If that call was not successful, throw an error.
    throw Exception('Failed to load get');
}

//
restPost(String path, String payload, [bool auth = false]) async {
  final response = await http.post(API + path,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "Authorization": "Bearer  ${(auth) ? await prefs("token") : ""}"
      },
      body: payload,
      encoding: Encoding.getByName('UTF8'));
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('Failed to load post');
}

//
restPut(String path, String payload, [bool auth = false]) async {
  print("--put 1--");
  final response = await http.put(API + path,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "Authorization": "Bearer  ${(auth) ? await prefs("token") : ""}"
      },
      body: payload,
      encoding: Encoding.getByName('UTF8'));
  print("--put 2--");
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('Failed to put');
}

//
restDelete(String path) async {
  final response = await http.delete(API + path, headers: _header());
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('Failed to delete');
}

Map<String, String> _header() {
  return {
    HttpHeaders.contentTypeHeader: "application/json",
    "Authorization": "Bearer ${prefs("token")}"
  };
}
