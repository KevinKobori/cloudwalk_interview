import 'package:fluttely_core/fluttely_core.dart';
import 'package:localstorage/localstorage.dart' as ls;

LocalStorage localStorageAdapterFactory(String keyPath) =>
    LocalStorageAdapter(localStorage: ls.LocalStorage(keyPath));
