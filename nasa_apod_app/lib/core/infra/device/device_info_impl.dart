import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class DeviceInfoImpl implements DeviceInfo {
  final InternetConnectionChecker connectionChecker;

  DeviceInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
