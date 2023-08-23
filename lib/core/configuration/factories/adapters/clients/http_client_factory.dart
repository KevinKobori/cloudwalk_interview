import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:http/http.dart';

IHttpClient httpClientAdapterFactory() => HttpClientAdapter(Client());
