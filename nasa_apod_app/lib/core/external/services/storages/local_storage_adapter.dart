import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:localstorage/localstorage.dart';

class LocalStorageAdapter implements ILocalStorage {
  final LocalStorage localStorage;

  LocalStorageAdapter({required this.localStorage});

  @override
  Future<void> save({required String key, required dynamic value}) async {
    await localStorage.deleteItem(key);
    await localStorage.setItem(key, value);
  }

  @override
  Future<void> delete(String key) async {
    await localStorage.deleteItem(key);
  }

  @override
  Future<dynamic> fetch(String key) async {
    return await localStorage.getItem(key);
  }
}
