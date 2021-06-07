import 'dart:async';
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
    "Content-Type": "application/json;charset=utf-8",
    "Accept-Language": "en",
    "App-Version": "1.0.0",
    "Platform": "Android",
  };

  static final String body = json.encode(data);
  static final Duration timeout = Duration(seconds: 30);
  final countLimit = 1000;
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

  Future<http.Response> postGenericWithBodyWithOutToken(
      String urlFragment, Map data) async {
    var url = domain + urlFragment;
    String body = json.encode(data);
    //headers["Authorization"] = 'Bearer $token';

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print("response here ");
    print(response.body);
    return response;
  }

  Future<http.Response> postGenericWithBody(
      String urlFragment, String token, Map data) async {
    var url = domain + urlFragment;
    String body = json.encode(data);
    headers["Authorization"] = 'Bearer $token';
    var response = await http
        .post(
      Uri.parse(url),
      headers: headers,
      body: body,
    )
        .timeout(
      timeout,
      onTimeout: () {
        throw TimeoutException;
      },
    );

    return response;
  }

  Future<http.Response> fetchTimeJson({String token}) async =>
      postGeneric(TIME_NOW, token);

  Future<http.Response> fetchHomeJson({String token}) async =>
      postGeneric(HOME_PAGE, token);

  Future<http.Response> fetchCitiesJson(String token) async =>
      postGeneric(CITIES + GET_ALL, token);

  Future<http.Response> fetchPrizeAllJson({String token}) async =>
      postGeneric(PRIZES + GET_ALL, token);

  Future<http.Response> fetchPrizePageJson({String token}) async =>
      postGeneric(PRIZESPage, token);

  Future<http.Response> fetchWheelPageJson({String token}) async =>
      postGeneric(LUCKY_WHEEL + GET_ONE, token);

  Future<http.Response> fetchPremiumWheelPageJson({String token}) async =>
      postGeneric(LUCKY_WHEEL + GET_Premium, token);

  Future<http.Response> fetchBonusJson({String token}) async =>
      postGeneric(DAILY_BONUS + GET_ONE, token);
  Future<http.Response> fetchPremiumBonusJson({String token}) async =>
      postGeneric(DAILY_BONUS + GET_Premium, token);

  Future<http.Response> fetchAddDailyBonus({int prizeId, String token}) async {
    Map data = {"PrizeId": prizeId};

    return postGenericWithBody(ADD_DAILY_BONUS, token, data);
  }

  Future<http.Response> fetchAddLucky({int prizeId, String token}) async {
    Map data = {"PrizeId": prizeId};

    return postGenericWithBody(ADD_LUCKY, token, data);
  }

  Future<http.Response> fetchAddLuckyPremium(
      {int prizeId, String token}) async {
    Map data = {"PrizeId": prizeId};

    return postGenericWithBody(ADD_LUCKY_Premium, token, data);
  }

  Future<http.Response> fetchTaskPageJson(String token) async =>
      postGeneric(TASKS + GET_ALL, token);

  Future<http.Response> fetchCustomerFinishedTaskJson(String token) async =>
      postGeneric(TASKS + GET_Finished, token);

  Future<http.Response> signIn(
      {String mobile, String password, String fcm_token}) async {
    print(password);
    print(mobile);
    print(fcm_token);
    Map data = {
      "password": password,
      "username": mobile,
      "fCMToken": fcm_token,
    };

    return postGenericWithBodyWithOutToken(LOGIN, data);

    //return postGenericWithBodyWithOutToken(CITIES + GET_ALL, data);
  }

  Future<http.Response> register(
      {String mobile,
      String firstName,
      String lastName,
      String password,
      String email,
      int gender}) async {
    Map data = {
      "Phone": mobile,
      "FirstName": firstName,
      "LastName": lastName,
      "Gender": gender == 0 ? false : true,
      "TermsAndConditions": true,
      "Password": password,
      "email": email,
    };

    return postGenericWithBodyWithOutToken(REGISTER, data);

    //return postGenericWithBodyWithOutToken(CITIES + GET_ALL, data);
  }

  Future<http.Response> setFCMToken({String fcmToken, String token}) async {
    Map data = {"FCMToken": fcmToken};

    return postGenericWithBody(SET_FCM_TOKEN, token, data);
  }
}
