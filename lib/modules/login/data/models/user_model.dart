// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:house_app/lib.dart';

class UserModel extends UserEntity {
  final String name;
  final String token;

  UserModel({
    required this.name,
    required this.token,
  }) : super(name: name, token: token);

  Map<String, dynamic> toMap() => {
        'name': name,
        'token': token,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'] ?? '',
        token: map['token'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
