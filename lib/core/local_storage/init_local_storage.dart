import 'package:hive/hive.dart';
import 'package:house_app/lib.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initLocalStorage() async {
  // var path = Directory.current.path;
  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  await Hive.openBox(appBox);
}

Box get getOpenedBox => Hive.box(appBox);
