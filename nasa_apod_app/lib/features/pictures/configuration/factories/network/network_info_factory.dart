import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

NetworkInfo networkInfoFactory() =>
    NetworkInfoImpl(InternetConnectionChecker());
