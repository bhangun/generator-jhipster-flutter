import 'dart:async';
import 'dart:convert';
import 'package:jh_flutter_sample/models/metrics.dart';
import '../services/api.dart';



Future<Health> health() async {

 var response = await restGet("management/metrics","true",true);

  return Health.fromJson(json.decode(response));
}