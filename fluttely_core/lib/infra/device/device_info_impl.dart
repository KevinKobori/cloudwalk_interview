import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttely_core/fluttely_core.dart';

class DeviceInfoImpl implements DeviceInfo {
  final Connectivity connectionChecker;

  DeviceInfoImpl(this.connectionChecker);

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectionChecker.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
