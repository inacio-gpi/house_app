import 'package:house_app/lib.dart';

void houseRulesBinding() {
  I
    ..registerLazySingleton<IHouseRulesDataSource>(() => HouseRulesDataSource(I()))
    ..registerLazySingleton<IHouseRulesRepository>(() => HouseRulesRepository(I()))
    ..registerLazySingleton<IGetHouseRulesUseCase>(() => GetHouseRulesUseCase(I()))
    ..registerLazySingleton<HouseRulesCubit>(() => HouseRulesCubit(I(), I()));
}
