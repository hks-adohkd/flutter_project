import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
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

  static final String domain = "http://10.0.2.2:1095/";

  Future<http.Response> postGeneric(String urlFragment) async {
    var url = domain + urlFragment;

    var response = await http.post(Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }

  Future<http.Response> fetchHomeJson() async =>
      postGeneric("api/Home/GetHome");

  Future<http.Response> fetchCitiesJson() async =>
      postGeneric("api/Cities/GetAll");

}