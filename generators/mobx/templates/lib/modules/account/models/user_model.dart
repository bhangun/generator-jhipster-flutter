import 'dart:convert';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  User(
      { this.id,
      this.login,
      this.firstName,
      this.lastName,
      this.email,
      this.imageUrl,
      this.activated,
      this.langKey,
      this.authorities,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate})
      : super();

  final int? id;
  final String? login;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? imageUrl;
  final bool? activated;
  final String? langKey;
  final List<dynamic>? authorities;
  final String? createdBy;
  final DateTime? createdDate;
  final String? lastModifiedBy;
  final DateTime? lastModifiedDate;

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
        '"createdDate"': '"' + createdDate!.toIso8601String() + 'Z"',
        '"lastModifiedBy"': '"$lastModifiedBy"',
        '"lastModifiedDate"': '"' + lastModifiedDate!.toIso8601String() + 'Z"'
      };

  static List<User> listFromString(String str) =>
      new List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

  static List<User> listFromJson(List<dynamic> data) {
    return data.map((post) => User.fromJson(post)).toList();
  }

  static String listUserToJson(List<User> data) =>
      json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

  static const empty = null;

  @override
  List<Object> get props =>
      [/* login, firstName!, lastName!, email!, authorities!, langKey! */];

}

class UserList {
  final List<User>? users;

  UserList({
    this.users,
  });

  factory UserList.fromJson(List<dynamic> json) {
    List<User> users = <User>[];
    users = json.map((post) => User.fromJson(post)).toList();

    return UserList(
      users: users,
    );
  }
}
