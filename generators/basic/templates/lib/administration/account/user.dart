import 'package:flutter/foundation.dart';

class User {
  const User(
      {this.id,
      @required this.login,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.imageUrl,
      @required this.activated,
      @required this.langKey,
      @required this.authorities,
      @required this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate})
      : assert(login != null),
        assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(imageUrl != null),
        assert(activated != null),
        assert(langKey != null),
        assert(authorities != null),
        assert(createdBy != null),
        assert(createdDate != null);

  final int id;
  final String login;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final bool activated;
  final String langKey;
  final List<dynamic> authorities;
  final String createdBy;
  final DateTime createdDate;
  final String lastModifiedBy;
  final DateTime lastModifiedDate;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        login: json['login'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        imageUrl: json['imageUrl'],
        activated: json['activated'],
        langKey: json['langKey'],
        authorities: json['authorities'],
        createdBy: json['createdBy'],
        createdDate: (json['createdDate'] != null)
            ? DateTime.parse(json['createdDate'])
            : null,
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedDate: (json['lastModifiedDate'] != null)
            ? DateTime.parse(json['lastModifiedDate'])
            : null);
  }

  Map<String, dynamic> toJson() => {
        '"id"': '"$id"',
        '"login"': '"$login"',
        '"firstName"': '"$firstName"',
        '"lastName"': '"$lastName"',
        '"email"': '"$email"',
        '"imageUrl"': '"$imageUrl"',
        '"activated"': '"$activated"',
        '"langKey"': '"$langKey"',
        '"authorities"': '$authorities',
        '"createdBy"': '"$createdBy"',
        '"createdDate"': '"' + createdDate.toIso8601String() + 'Z"',
        '"lastModifiedBy"': '"$lastModifiedBy"',
        '"lastModifiedDate"': '"' + lastModifiedDate.toIso8601String() + 'Z"'
      };
}

/*
"id" : 3,
  "login" : "admin",
  "firstName" : "Administrator",
  "lastName" : "Administrator",
  "email" : "admin@localhost",
  "imageUrl" : "",
  "activated" : true,
  "langKey" : "en",
  "createdBy" : "system",
  "createdDate" : "2018-07-02T07:46:23.273Z",
  "lastModifiedBy" : "system",
  "lastModifiedDate" : null,
  "authorities" : [ "ROLE_USER", "ROLE_ADMIN" ]


  {
  "activated": true,
  "authorities": [
    "string"
  ],
  "createdBy": "string",
  "createdDate": "2019-04-17T09:49:53.653Z",
  "email": "string",
  "firstName": "string",
  "id": 0,
  "imageUrl": "string",
  "langKey": "string",
  "lastModifiedBy": "string",
  "lastModifiedDate": "2019-04-17T09:49:53.653Z",
  "lastName": "string",
  "login": "string"
}
 */
