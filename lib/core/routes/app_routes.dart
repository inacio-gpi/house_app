// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

class AppRoutes {
  static Future<String> initial = _getRoute();

  static Future<String> _getRoute() async {
    final storage = I.get<ILocalStorage>();
    final userJson = await storage.getData(CACHED_USER);

    final user = UserModel.fromJson(userJson ?? json.encode(mapEmpty));
    if (user == UserModel.empty()) {
      return login;
    }
    final userService = I.get<UserService>();
    await userService.setUserInfo(user);
    return houseRules;
  }

  static const String login = '/login';
  static const String houseRules = '/houseRules';

  static Map<String, WidgetBuilder> mapRoutes = {
    AppRoutes.login: (context) => LoginPage(cubit: I.get()),
    AppRoutes.houseRules: (context) => HouseRulesPage(cubit: I.get()),
  };
}
