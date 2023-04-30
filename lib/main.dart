import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

void main() async {
  initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'House App',
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.mapRoutes,
      );
}
