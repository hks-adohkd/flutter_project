import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_request_prize_api_response.dart';
import 'package:open_sism/data_layer/model/pagination/customer_prize_pagination_model.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_api_response.dart';
import 'package:open_sism/data_layer/model/dailyBonus/bonus_api_response.dart';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_prize_api_response.dart';

class PrizeRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<PrizeModel> getPrizeAll({String token}) async {
    var response = await dataProvider.fetchPrizeAllJson(token: token);
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var prizeModel = PrizeModel.fromJson(jsonObj);
    //  print(homeModel);
    // print("prize Model : ");
    // print(prizeModel);
    return prizeModel;
  }

  Future<PrizeApiResponse> getPrizePage({String token}) async {
    var response = await dataProvider.fetchPrizePageJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var prizePageModel = PrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("prize Model : ");
    print(prizePageModel);
    return prizePageModel;
  }

  Future<CustomerPrizeApiResponse> requestPrize(
      {String token, int prizeId}) async {
    var response = await dataProvider.fetchRequestPrizeJson(
        token: token, prizeId: prizeId);
    var jsonObj = json.decode(response.body);
    print(jsonObj);
    var prizePageModel = CustomerPrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("prize Model : ");
    print(prizePageModel);
    return prizePageModel;
  }

  Future<WheelApiResponse> getWheelPrizes({String token}) async {
    var response = await dataProvider.fetchWheelPageJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var wheelPageModel = WheelApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("prize Model : ");
    // print(wheelPageModel);
    return wheelPageModel;
  }

  Future<WheelApiResponse> getPremiumWheelPrizes({String token}) async {
    var response = await dataProvider.fetchPremiumWheelPageJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var wheelPageModel = WheelApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("prize Model : ");
    // print(wheelPageModel);
    return wheelPageModel;
  }

  Future<BonusApiResponse> getBonusPrizes({String token}) async {
    var response = await dataProvider.fetchBonusJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var bonusModel = BonusApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("prize Model : ");
    // print(bonusModel);
    return bonusModel;
  }

  Future<BonusApiResponse> getPremiumBonusPrizes({String token}) async {
    var response = await dataProvider.fetchPremiumBonusJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var bonusModel = BonusApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("prize Model : ");
    // print(wheelPageModel);
    return bonusModel;
  }

  Future<CustomerPrizeApiResponse> addBonusPrizes(
      {int prizeId, String token}) async {
    var response =
        await dataProvider.fetchAddDailyBonus(prizeId: prizeId, token: token);
    var jsonObj = json.decode(response.body);

    var customerPrizeModel = CustomerPrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("customerPrizeModel : ");
    // print(customerPrizeModel);
    return customerPrizeModel;
  }

  Future<CustomerPrizeApiResponse> addLuckyPrizes(
      {int prizeId, String token}) async {
    var response =
        await dataProvider.fetchAddLucky(prizeId: prizeId, token: token);
    var jsonObj = json.decode(response.body);

    var customerPrizeModel = CustomerPrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("customerPrizeModel : ");
    // print(customerPrizeModel);
    return customerPrizeModel;
  }

  Future<CustomerPrizeApiResponse> addPremiumLuckyPrizes(
      {int prizeId, String token}) async {
    var response =
        await dataProvider.fetchAddLuckyPremium(prizeId: prizeId, token: token);
    var jsonObj = json.decode(response.body);

    var customerPrizeModel = CustomerPrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("customerPrizeModel : ");
    // print(customerPrizeModel);
    return customerPrizeModel;
  }

  Future<CustomerRequestPrizeApiResponse> getOrderedCustomerPrize(
      {String token}) async {
    var response =
        await dataProvider.fetchGetOrderedCustomerPrize(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var customerRequestPrizeModel =
        CustomerRequestPrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    //print("customerPrizeModel : ");
    // print(customerRequestPrizeModel);
    return customerRequestPrizeModel;
  }
}
