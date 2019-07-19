import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable{
  User(
      {this.id,
      @required this.login,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      this.imageUrl,
      @required this.activated,
      this.langKey,
      @required this.authorities,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate}): 
      super([id,login,firstName,lastName,email,imageUrl,activated,
      langKey,authorities,createdBy,createdDate,lastModifiedBy,lastModifiedDate]);

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

  static List<User> listFromString(String str) => new List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

  static List<User> listFromJson(List<dynamic> data) {
    return data.map((post) => User.fromJson(post)).toList();
  }

  static String listUserToJson(List<User> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));
}

class UserList {
  final List<User> users;

  UserList({
    this.users,
  });

  factory UserList.fromJson(List<dynamic> json) {
    List<User> users = List<User>();
    users = json.map((post) => User.fromJson(post)).toList();

    return UserList(
      users: users,
    );
  }
}

/* final parsed = json.decode('data').cast<Map<String, dynamic>>();
    List<User> _items = json.decode('data').cast<Map<String, dynamic>>().map<User>((json) => User.fromJson(json)).toList();
 */