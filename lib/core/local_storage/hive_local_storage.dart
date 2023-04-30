import 'package:hive/hive.dart';
import 'package:house_app/lib.dart';

class HiveLocalStorage implements ILocalStorage {
  final Box _box;

  HiveLocalStorage(this._box);

  @override
  Future<void> saveData(String key, dynamic data) async {
    await _box.put(key, data);
  }

  @override
  Future<dynamic> getData(String key) async => _box.get(key);

  @override
  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }
}
