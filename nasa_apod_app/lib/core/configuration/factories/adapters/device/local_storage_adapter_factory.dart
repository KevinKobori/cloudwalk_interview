import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:localstorage/localstorage.dart';

ILocalStorage localStorageAdapterFactory(String keyPath) =>
    LocalStorageAdapter(localStorage: LocalStorage(keyPath));
