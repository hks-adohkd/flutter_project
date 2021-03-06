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

  Future<http.Response> fetchAboutJson({String token}) async =>
      postGeneric(ABOUT_US, token);

  Future<http.Response> fetchCitiesJson(String token) async =>
      postGeneric(CITIES + GET_ALL, token);

  Future<http.Response> fetchPrizeAllJson({String token}) async =>
      postGeneric(PRIZES + GET_ALL, token);

  Future<http.Response> fetchPrizePageJson({String token}) async =>
      postGeneric(PRIZESPage, token);

  Future<http.Response> fetchRequestPrizeJson(
      {String token, int prizeId}) async {
    Map data = {"PrizeId": prizeId, "description": "request"};

    return postGenericWithBody(PRIZES + REQUEST_PRIZE, token, data);
  }

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

  Future<http.Response> fetchSingleTaskJson(
      {String token, String taskId}) async {
    Map data = {"id": taskId};
    return postGenericWithBody(TASKS + GET_ONE, token, data);
  }

  Future<http.Response> fetchMatchJson({String token, String taskId}) async {
    Map data = {"appTaskId": taskId};
    return postGenericWithBody(SPORT_MATCHES + GET_ONE, token, data);
  }

  Future<http.Response> fetchAddMatchEndJson(
      {String token,
      int matchId,
      int firstTeamScore,
      int secondTeamScore}) async {
    Map data = {
      "SportMatchId": matchId,
      "FirstTeamScore": firstTeamScore,
      "SecondTeamScore": secondTeamScore
    };
    return postGenericWithBody(SPORT_MATCHES + ADD_END, token, data);
  }

  Future<http.Response> fetchContactUSPageJson(String token) async =>
      postGeneric(CONTACT_US + GET_CUSTOMER_ALL, token);

  Future<http.Response> fetchAddSupportMessageJson(
      {String token,
      String email,
      String subject,
      String message,
      String phone,
      String firstName,
      String lastName}) async {
    Map data = {
      "subject": subject,
      "message": message,
      "phoneNumber": phone,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
    };

    return postGenericWithBody(CONTACT_US + ADD, token, data);

    //return postGenericWithBodyWithOutToken(CITIES + GET_ALL, data);
  }

  Future<http.Response> fetchCustomerMessageJson({String token}) async =>
      postGeneric(CUSTOMER_MESSAGES + GET_ALL, token);
  Future<http.Response> fetchCustomerProfileJson({String token}) async =>
      postGeneric(GET_PROFILE, token);

  Future<http.Response> fetchCustomerUpdateProfileJson(
      {String address,
      String firstName,
      String lastName,
      String email,
      String token}) async {
    Map data = {
      "Address": address,
      "FirstName": firstName,
      "LastName": lastName,
      "email": email,
    };

    return postGenericWithBody(UPDATE_PROFILE, token, data);

    //return postGenericWithBodyWithOutToken(CITIES + GET_ALL, data);
  }

  Future<http.Response> fetchCustomerUpdatePasswordJson(
      {String oldPassword,
      String newPassword,
      String confirmPassword,
      String token}) async {
    Map data = {
      "OldPassword": oldPassword,
      "NewPassword": newPassword,
      "ConfirmPassword": confirmPassword,
    };

    return postGenericWithBody(CHANGE_PASSWORD, token, data);

    //return postGenericWithBodyWithOutToken(CITIES + GET_ALL, data);
  }

  Future<http.Response> fetchCustomerFinishedTaskJson(String token) async =>
      postGeneric(TASKS + GET_Finished, token);
  Future<http.Response> fetchGetOrderedCustomerPrize({String token}) async =>
      postGeneric(CUSTOMER_REQUEST_PRIZES, token);

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
