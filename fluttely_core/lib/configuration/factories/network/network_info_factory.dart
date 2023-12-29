import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttely_core/fluttely_core.dart';

DeviceInfo networkInfoFactory() => DeviceInfoImpl(Connectivity());
