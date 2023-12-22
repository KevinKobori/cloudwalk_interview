import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class DeviceInfoHelperImpl implements DeviceInfoHelper {
  final InternetConnectionChecker connectionChecker;

  DeviceInfoHelperImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
