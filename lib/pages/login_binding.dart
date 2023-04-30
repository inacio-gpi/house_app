import 'package:house_app/lib.dart';
import 'package:house_app/pages/login_controller.dart';

void loginBinding() {
  I.registerLazySingleton<LoginController>(() => LoginController(I()));
}
