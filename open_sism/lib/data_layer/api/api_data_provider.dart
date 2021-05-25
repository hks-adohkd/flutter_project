import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_sism/data_layer/api/api_constants.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class OpenSismApiDataProvider {
  static final Map data = {
    "page": 1,
    "limit": 100,
  };

  static final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept-Language": "en",
    "App-Version": "1.0.0",
    "Platform": "Android",
  };

  static final String body = json.encode(data);

  static final String domain = API_Domain;

  Future<http.Response> postGeneric(String urlFragment, String token) async {
    var url = domain + urlFragment;
    headers["Authorization"] = 'Bearer $token';
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }

  Future<http.Response> fetchHomeJson(String token) async =>
      postGeneric(HOME_PAGE, token);

  Future<http.Response> fetchCitiesJson(String token) async =>
      postGeneric(CITIES + GET_ALL, token);
}
