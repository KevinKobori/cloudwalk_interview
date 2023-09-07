import 'package:http/http.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class HttpClientAdapter implements IHttpClient {
  final Client client;

  HttpClientAdapter(this.client);

  @override
  Future<Result<dynamic, InfraException>> request(
      {required String url,
      required String method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? Json.tryEncode(body) : null;
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
      return Error(InfraException(ExternalErrorType.serverError.infraError));
    }
    return _handleResponse(response);
  }

  Result<dynamic, InfraException> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return Success(response.body.isEmpty ? null : response.body);
      case 201:
        return Success(response.body.isEmpty ? null : response.body);
      case 204:
        return const Success(null);
      case 400:
        return Error(InfraException(ExternalErrorType.badRequest.infraError));
      case 401:
        return Error(InfraException(ExternalErrorType.unauthorized.infraError));
      case 403:
        return Error(InfraException(ExternalErrorType.forbidden.infraError));
      case 404:
        return Error(InfraException(ExternalErrorType.notFound.infraError));
      case 500:
        return Error(InfraException(ExternalErrorType.serverError.infraError));
      default:
        return Error(InfraException(ExternalErrorType.serverError.infraError));
    }
  }
}
