import 'package:flutter/material.dart';
import 'package:house_app/lib.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  initInjector();
  runApp(
    MyApp(
      initialRoute: await AppRoutes.initial,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);
  final String initialRoute;
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'House App',
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.system,
        initialRoute: initialRoute,
        routes: AppRoutes.mapRoutes,
      );
}
