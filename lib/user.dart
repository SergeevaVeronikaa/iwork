import 'dart:convert';

import 'package:flutter/material.dart';

class UserFields{
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String isBeginner = 'isBeginner';
  static const String phone = 'phone';
  static const String description = 'description';

  static List<String> getFields() => [id, name, email, isBeginner, phone, description];
}

class User{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String description;
  final bool isBeginner;

  const User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.description,
    @required this.isBeginner,
});

  User copy({
    int id,
    String name,
    String email,
    String phone,
    String description,
    bool isBeginner,
}) =>
  User(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    description: description ?? this.description,
    isBeginner: isBeginner ?? this.isBeginner,
  );

  static User fromJson(Map<String, dynamic> json) => User (
    id: jsonDecode(json[UserFields.id]),
    name: json[UserFields.name],
    email: json[UserFields.email],
    phone: json[UserFields.phone],
    description: json[UserFields.description],
    isBeginner: jsonDecode(json[UserFields.isBeginner]),
  );

  Map<String, dynamic> toJson() => {
    UserFields.id: id,
    UserFields.name: name,
    UserFields.email: email,
    UserFields.phone: phone,
    UserFields.description: description,
    UserFields.isBeginner: isBeginner,
  };

}