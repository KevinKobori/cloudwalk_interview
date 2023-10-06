import 'package:localstorage/localstorage.dart' as ls;
import 'package:nasa_apod_app/nasa_apod_app.dart';

LocalStorage localStorageAdapterFactory(String keyPath) =>
    LocalStorageAdapter(localStorage: ls.LocalStorage(keyPath));
