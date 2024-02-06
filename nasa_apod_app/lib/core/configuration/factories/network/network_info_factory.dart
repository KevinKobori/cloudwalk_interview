import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

DeviceInfo networkInfoFactory() => DeviceInfoImpl(Connectivity());
