import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:house_app/lib.dart';

class UserModel extends Equatable {
  final String name;
  final String token;

  const UserModel({
    required this.name,
    required this.token,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'token': token,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'] ?? '',
        token: map['token'] ?? '',
      );

  factory UserModel.empty() => UserModel.fromMap(mapEmpty);

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [name, token];
}
