import 'package:house_app/lib.dart';

void loginBinding() {
  I
    ..registerLazySingleton<ILoginLocalDataSource>(() => LoginLocalDataSource(I()))
    ..registerLazySingleton<ILoginRepository>(() => LoginRepository(I()))
    ..registerLazySingleton<IDoLoginUseCase>(() => DoLoginUseCase(I()))
    ..registerLazySingleton<LoginCubit>(() => LoginCubit(I(), I()));
}
