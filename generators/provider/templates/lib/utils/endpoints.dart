class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://localhost:8080";

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // booking endpoints
  static String post (String uri){
     return baseUrl + uri;
  }
}