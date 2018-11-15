import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/config.dart';

//
restGet(String path,[String token, bool isBasePath=false]) async {
  final response =  await http.get(isBasePath? BASE_URL+path:API+path,
      headers:{HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer  ${(token.isNotEmpty)? token:''}"});
    if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load get');
  }
}

//
restPost(String path,String payload,[String token]) async{
  final response =  await http.post(API+path,
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer ${(token.isNotEmpty)? token:''}"},
      body:payload,encoding: Encoding.getByName('UTF8') );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load post');
  }
}

//
restPut(String path,String payload,[String token]) async{
  final response =  await http.put(API+path,
      headers: {HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer ${(token.isNotEmpty)? token:''}"},
      body:payload,encoding: Encoding.getByName('UTF8') );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to update');
  }
}

//
restDelete(String path,[String token]) async{
  final response =  await http.delete(API+path,
      headers:{HttpHeaders.contentTypeHeader: "application/json",
        "Authorization":"Bearer ${(token.isNotEmpty)? token:''}"},
         );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to delete');
  }
}