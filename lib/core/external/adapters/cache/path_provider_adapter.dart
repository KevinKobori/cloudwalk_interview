import 'dart:io';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class PathProviderAdapter implements ICacheStorage {

  @override
  Future<void> save({required String key, required dynamic value}) async {}

  @override
  Future<void> delete(String key) async {}

  @override
  Future<dynamic> fetch(String key) async {}

  Future<Directory> getTemporaryDirectory() {
    return path_provider.getTemporaryDirectory();
  }
}