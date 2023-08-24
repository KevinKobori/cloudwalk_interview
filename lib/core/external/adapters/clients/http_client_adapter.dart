import 'dart:convert';

import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:http/http.dart';
import 'package:multiple_result/multiple_result.dart';

class HttpClientAdapter implements IHttpClient {
  final Client client;

  HttpClientAdapter(this.client);

  @override
  Future<Result<dynamic, ExternalException>> request(
      {required String url,
      required String method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    Future<Response>? futureResponse;
    try {
      if (method == 'post') {
        futureResponse = client.post(Uri.parse(url),
            headers: defaultHeaders, body: jsonBody);
      } else if (method == 'get') {
        futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
      } else if (method == 'put') {
        futureResponse =
            client.put(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (_) {
      return Error(ExternalException(ExternalErrorType.serverError));
    }
    return _handleResponse(response);
  }

  Result<dynamic, ExternalException> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return Success(response.body.isEmpty ? null : response.body);
      case 201:
        return Success(response.body.isEmpty ? null : response.body);
      case 204:
        return const Success(null);
      case 400:
        return Error(ExternalException(ExternalErrorType.badRequest));
      case 401:
        return Error(ExternalException(ExternalErrorType.unauthorized));
      case 403:
        return Error(ExternalException(ExternalErrorType.forbidden));
      case 404:
        return Error(ExternalException(ExternalErrorType.notFound));
      case 500:
        return Error(ExternalException(ExternalErrorType.serverError));
      default:
        return Error(ExternalException(ExternalErrorType.serverError));
    }
  }
}
