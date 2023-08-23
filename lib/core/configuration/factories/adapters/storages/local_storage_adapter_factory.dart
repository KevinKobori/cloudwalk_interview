import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:localstorage/localstorage.dart';

ILocalStorage localStorageAdapterFactory(String keyPath) =>
    LocalStorageAdapter(localStorage: LocalStorage(keyPath));
