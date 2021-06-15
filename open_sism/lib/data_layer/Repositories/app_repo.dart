import 'dart:convert';
import 'dart:io';

import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_sism/data_layer/model/about/about_api_response.dart';

class AppRepository {
  // final http.Client httpClient = http.Client();
  static final Duration timeout = Duration(seconds: 30);
  final countLimit = 1000;
  static const String shouldUpdate = 'should_update';
  static const String isOpenedBefore = 'is_opened_before';
  static const String key_fbToken = 'firebase_token';
  static const String key_notifications_count = 'notifications_count';
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();
  int minPrice;
  String homeTitle;
  String phoneNumber = '';
  String whatsAppNumber = '';
  String currency = '';

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<bool> checkShouldUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(shouldUpdate) ?? false;
  }

  Future<void> setShouldUpdate(bool v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(shouldUpdate, v);
  }

  Future<bool> checkIfOpenedBefore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(isOpenedBefore) ?? false;
  }

  Future<void> setIfOpenedBefore(bool v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isOpenedBefore, v);
  }

// Future<bool> getSettings() async {
//   final url = '${Configurations.BASE_URL}/Configuration/GetSettings';
//
//   final response = await this.httpClient.get(url).timeout(timeout);
//   var responseJson;
//
//   responseJson = returnResponse(response);
//
//   try {
//     List<Setting> settings = (responseJson as List)
//         .map(
//           (j) => Setting.fromJson(
//             json.encode(j),
//           ),
//         )
//         .toList();
//
//     var s = settings.firstWhere((c) => c.name == "MinOrderValue");
//     var title = settings.firstWhere((c) => c.name == "HomeTitle");
//     var land = settings.firstWhere((c) => c.name == "PhoneNumber");
//     var whats = settings.firstWhere((c) => c.name == "MobileNumber");
//     var currencyUnit = settings.firstWhere((c) => c.name == "DefaultCurrency");
//
//     minPrice = int.parse(s.value);
//     homeTitle = title.value;
//     phoneNumber = land.value.toString();
//     whatsAppNumber = whats.value.toString();
//     currency = currencyUnit.value.toString();
//
//     return true;
//   } on SocketException {
//     throw FetchDataException('No Internet connection');
//   }
// }

  Future<AboutApiResponse> getAboutData({String token}) async {
    var response = await dataProvider.fetchAboutJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var aboutModel = AboutApiResponse.fromJson(jsonObj);
    print("aboutModel");
    print(aboutModel);
    return aboutModel;
  }
}
