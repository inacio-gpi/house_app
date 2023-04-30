// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

abstract class AppRoutes {
  static const String login = '/login';
  static const String houseRules = '/houseRules';

  static Map<String, WidgetBuilder> mapRoutes = {
    AppRoutes.login: (context) => LoginPage(cubit: I.get()),
    AppRoutes.houseRules: (context) => HouseRulesPage(cubit: I.get()),
  };
}
