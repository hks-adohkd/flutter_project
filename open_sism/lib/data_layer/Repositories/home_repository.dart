import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/home/home_api_response.dart';

class HomeRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();
  Map<String, String> headers = {"content-type": "text/json"};
  Map<String, String> cookies = {};
  Future<HomeApiResponse> getHomeData({String token}) async {
    var response = await dataProvider.fetchHomeJson(token: token);
    print("updateCookie");
    updateCookie(response);
    print("response");
    print(response.headers);
    print(response.body);
    print(headers.length);
    print(headers);
    var jsonObj = json.decode(response.body);

    var homeModel = HomeApiResponse.fromJson(jsonObj);
    print("homeModel");
    print(homeModel);
    return homeModel;
  }

  void updateCookie(Response response) {
    String allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        this.cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.length > 0) cookie += ";";
      cookie += key + "=" + cookies[key];
    }

    return cookie;
  }
}
