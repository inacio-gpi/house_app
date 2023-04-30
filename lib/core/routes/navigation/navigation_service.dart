import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

class NavigationService implements INavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void back<T>({final T? result}) => Navigator.of(navigatorKey.currentContext!).pop(result);

  @override
  Future<T?>? offAllNamed<T>(
    final String path, {
    final dynamic arguments,
  }) async =>
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(path, (_) => false, arguments: arguments);

  @override
  Future<T?>? toNamed<T>(
    final String path, {
    final dynamic arguments,
  }) async =>
      Navigator.of(navigatorKey.currentContext!).pushNamed(path, arguments: arguments);
}
