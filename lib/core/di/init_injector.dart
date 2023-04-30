import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:house_app/lib.dart';
import 'package:house_app/pages/login_binding.dart';

final I = GetIt.instance;

void initInjector() {
  I
    ..registerSingleton<INavigationService>(NavigationService())
    ..registerSingleton<Dio>(Dio())
    ..registerLazySingleton<IRestClient>(() => RestClient(I()));
  loginBinding();
  houseRulesBinding();
}
