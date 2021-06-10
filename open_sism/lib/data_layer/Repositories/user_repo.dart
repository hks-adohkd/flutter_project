import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/application_user/application_user_model.dart';
import 'package:open_sism/data_layer/model/customer/customer_model.dart';
import 'package:open_sism/data_layer/model/message/customer_message_api_response.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:open_sism/data_layer/model/customer/customer_response_model.dart';
import 'package:open_sism/data_layer/model/application_user/time_model.dart';
import 'package:open_sism/data_layer/model/customer/customer_profile_api_response.dart';

class UserRepository {
  static const String key_id = 'id';
  static const String key_token = 'token';
  static const String key_name = 'firstName';
  static const String Key_surname = 'lastName';
  static const String key_username = 'userName';
  static const String key_mobile = 'phoneNumber';

  static const String key_is_verified = 'phoneNumberConfirmed';
  static const String key_logo = 'imageUrl';
  static const String key_email = 'email';
  static const String key_fcmToken = 'fcmToken';
  static const String key_lockoutEnabled = 'lockoutEnabled';
  static const String key_gender = 'gender';
  static const String key_currentPoints = 'currentPoints';
  static const String key_totalPoints = 'totalPoints';
  static const String key_premium = 'premium';
  static const String key_luckyWheelLastSpinDate = 'luckyWheelLastSpinDate';
  static const String key_dailyBonusLastUseDate = 'dailyBonusLastUseDate';
  static const String key_dailyBonusLevel = 'dailyBonusLevel';
  static const String key_cityId = 'cityId';
  static const String key_userId = 'userId';
  static const String key_groupId = 'groupId';

  final OpenSismApiDataProvider api = new OpenSismApiDataProvider();

  Future<TimeModel> getTime() async {
    var response = await api.fetchTimeJson(token: await getToken());
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var timeModel = TimeModel.fromJson(jsonObj);

    // print("timeModel : ");
    // print(timeModel);
    // print(prizeModel);
    return timeModel;
  }

  Future<CustomerMessageApiResponse> getCustomerMessage({String token}) async {
    var response = await api.fetchCustomerMessageJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var customerMessageModel = CustomerMessageApiResponse.fromJson(jsonObj);

    // print("customerMessageModel : ");
    // print(customerMessageModel);
    // print(prizeModel);
    return customerMessageModel;
  }

  Future<CustomerProfileApiResponse> getCustomerProfile({String token}) async {
    var response = await api.fetchCustomerProfileJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var customerProfile = CustomerProfileApiResponse.fromJson(jsonObj);

    print("customerProfile : ");
    // print(customerMessageModel);
    print(customerProfile);
    return customerProfile;
  }

  Future<PrizeModel> getPrizeAll() async {
    var response = await api.fetchPrizeAllJson();
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var prizeModel = PrizeModel.fromJson(jsonObj);

    // print("prize Model : ");
    // print(prizeModel);
    // print(prizeModel);
    return prizeModel;
  }

  Future<CustomerApiResponse> signInWithCredentials(
      String mobile, String password, String fcmToken) async {
    try {
      var response = await api.signIn(
          fcm_token: fcmToken, mobile: mobile, password: password);
      // print(response.body);

      var jsonObj = json.decode(response.body);

      var customerApiResponse = CustomerApiResponse.fromJson(jsonObj);
      //  print(homeModel);
      //print("customerModel : ");
      //print(customerApiResponse);
      persistUser(customerApiResponse.currentCustomer);
      return customerApiResponse;

      //CustomerModel user = await _api.signIn(fcm_token: fcmToken , mobile: mobile , password: password);

      // User user = User((u) => u
      //   ..id = 1
      //   ..mobile = '0991345379'
      //   ..name = 'emad'
      //   ..email = 'email@example.com'
      //   ..address = ''
      //   ..username = 'supernova'
      //   ..verified = false
      //   ..token = 'fake sweet token');

    } catch (e) {
      print('Error signInWithCredentials:$e');
      throw e;
    }
  }

  Future<CustomerApiResponse> registerWithCredentials({
    String mobile,
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirm,
    int gender,
  }) async {
    try {
      var response = await api.register(
          mobile: mobile,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          gender: gender);
      //   print(response.body);
      var jsonObj = json.decode(response.body);
      var customerApiResponse = CustomerApiResponse.fromJson(jsonObj);
      //   print("customerModel : ");
      //    print(customerApiResponse);
      persistUser(customerApiResponse.currentCustomer);
      return customerApiResponse;
    } catch (e) {
      print('Error signInWithCredentials:$e');
      throw e;
    }
  }

  Future<void> persistUser(CustomerModel u) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt(key_id, u.id);
    if (u.token.isNotEmpty) prefs.setString(key_token, u.token);
    prefs.setString(key_mobile, u.user.phoneNumber);
    prefs.setString(key_name, u.firstName);
    prefs.setString(Key_surname, u.lastName);
    prefs.setString(key_username, u.user.userName);
    prefs.setString(key_logo, u.imageUrl);

    prefs.setString(key_email, u.user.email);
    prefs.setString(key_fcmToken, u.fcmToken);
    prefs.setBool(key_is_verified, u.user.phoneNumberConfirmed);
    prefs.setBool(key_lockoutEnabled, u.lockOutEnabled);
    prefs.setBool(key_gender, u.gender);

    prefs.setInt(key_currentPoints, u.currentPoints);
    prefs.setInt(key_totalPoints, u.totalPoints);

    prefs.setBool(key_premium, u.premium);
    prefs.setString(
        key_luckyWheelLastSpinDate, u.luckyWheelLastSpinDate.toString());
    prefs.setString(
        key_dailyBonusLastUseDate, u.dailyBonusLastUseDate.toString());
    prefs.setInt(key_dailyBonusLevel, u.dailyBonusLevel);
    prefs.setInt(key_cityId, u.cityId);
    prefs.setString(key_userId, u.userId);
    prefs.setInt(key_groupId, u.groupId);

    return;
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key_token);
    return;
  }

  Future<void> persistToken(String t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key_token, t);
    return;
  }

  Future<void> persistFCMToken(String t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key_fcmToken, t);
    return;
  }

  Future<CustomerApiResponse> userSetFCMToken({String fcmToken}) async {
    try {
      //  print("token");
      //  print(await getToken());
      //   print("userSetFCMToken");
      //   print(fcmToken);
      var response =
          await api.setFCMToken(fcmToken: fcmToken, token: await getToken());
      //  print("response");
      //   print(response.body);
      var jsonObj = json.decode(response.body);
      //  print(jsonObj);
      var customerApiResponse = CustomerApiResponse.fromJson(jsonObj);
      //     print("customerApiResponse");
      //    print(customerApiResponse);
      return customerApiResponse;
    } catch (e) {
      print('error Set FCM Token :  $e');
    }
  }

  Future<void> deleteFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key_fcmToken);
    return;
  }

  Future<CustomerModel> getUser() async {
    bool loggedIn = await hasToken();

    // print('token: ${await getToken()}');
    if (loggedIn) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      CustomerModel user = CustomerModel(
          id: prefs.getInt(key_id),
          token: prefs.getString(key_token),
          firstName: prefs.getString(key_name),
          lastName: prefs.getString(Key_surname),
          imageUrl: prefs.getString(key_logo),
          cityId: prefs.getInt(key_cityId),
          currentPoints: prefs.getInt(key_logo),
          dailyBonusLevel: prefs.getInt(key_dailyBonusLevel),
          fcmToken: prefs.getString(key_fcmToken),
          gender: prefs.getBool(key_gender),
          groupId: prefs.getInt(key_groupId),
          premium: prefs.getBool(key_premium),
          lockOutEnabled: prefs.getBool(key_lockoutEnabled),
          userId: prefs.getString(key_userId),
          totalPoints: prefs.getInt(key_totalPoints),
          user: ApplicationUserModel(
            phoneNumber: prefs.getString(key_mobile),
            userName: prefs.getString(key_mobile),
          ));

      return user;
    } else
      return null;
  }

  // Future<bool> resendCode(String mobile) async {
  //   bool res = await _api.resendCode(mobile);
  //   return res ?? false;
  // }

  // Future<bool> resetPassword(String mobile, String newPassword) async {
  //   try {
  //     bool res = await _api.updatePassword(mobile, newPassword);
  //     return res ?? false;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<bool> verifyMobile(String mobile, String code) async {
  //   try {
  //     bool res = await _api.verifyMobile(mobile, code, await getToken());
  //
  //     if (res) {
  //       setIsVerifiedMobile(res);
  //     }
  //     return res ?? false;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<bool> verifyMobileWithoutToken(String mobile, String code) async {
  //   try {
  //     bool res = await _api.verifyMobileWithoutToken(mobile, code);
  //
  //     if (res) {
  //       setIsVerifiedMobile(res);
  //     }
  //     return res ?? false;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<bool> verifyAddress(String address) async {
  //   try {
  //     bool res = await _api.verifyAddress(address, await getToken());
  //     // String res = 'new address';
  //     //
  //     // await Future.delayed(Duration(seconds: 2));
  //
  //     if (res) {
  //       setIsVerifiedAddress(address);
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }
  // }

  // Future<bool> updateProfilePicture(String img) async {
  //   try {
  //     String res = await _api.updateUserLogo(img, await getToken());
  //
  //     setProfilePicture(res);
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }
  // }

  // Future<bool> updateUser(String name, String whatsApp, String address) async {
  //   try {
  //     bool res = await _api.updateUserContact(
  //         name, whatsApp, address, await getToken());
  //
  //     await setIsVerifiedAddress(address);
  //     await setWhatsApp(whatsApp);
  //     await setName(name);
  //
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }
  // }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key_token);
  }

  Future<bool> isVerified() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key_is_verified) ?? false;
  }

  Future<void> setIsVerifiedMobile(bool isVerified) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(key_is_verified, isVerified);
  }

  Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key_name, name);
  }

  Future<void> setProfilePicture(String imgUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key_logo, imgUrl);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key_token);
  }

  Future<String> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key_fcmToken);
  }
  // Future<User> getUserProfile() async {
  //   try {
  //     // print('token: ${await getToken()}');
  //     User user = await _api.getUserProfile(await getToken());
  //
  //     return user;
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }
  // }
}
