import 'package:http/http.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

HttpClient httpClientAdapterFactory() => HttpClientAdapter(Client());
