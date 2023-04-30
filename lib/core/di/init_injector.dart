import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:house_app/lib.dart';

final I = GetIt.instance;

void initInjector() {
  initialBinding();
  loginBinding();
  houseRulesBinding();
}

void initialBinding() {
  I
    ..registerSingleton<INavigationService>(NavigationService())
    ..registerSingleton<Box>(getOpenedBox)
    ..registerSingleton<LocalStorage>(HiveLocalStorage(I()))
    ..registerSingleton<Dio>(Dio())
    ..registerLazySingleton<IRestClient>(() => RestClient(I()));
}
