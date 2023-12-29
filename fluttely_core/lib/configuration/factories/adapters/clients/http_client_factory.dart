import 'package:fluttely_core/fluttely_core.dart';
import 'package:http/http.dart';

HttpClient httpClientAdapterFactory() => HttpClientAdapter(Client());
