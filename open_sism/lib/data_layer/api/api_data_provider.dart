import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<http.Response> fetchCities() async {
  print("communicating");
  var url = 'http://10.0.2.2:1095/api/Cities/GetAll';

  Map data = {"page": 1, "limit": 100};

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept-Language": "ar",
    "App-Version": "1.0.0",
    "Platform": "Android",
  };

  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url), headers: headers, body: body);
  print("tt");
  print("${response.statusCode}");
  print("${response.body}");
  return response;
}
