import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/task/taskPage_model.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';

class TaskRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  // Future<TaskModel> getPrizeAll() async {
  //   var response = await dataProvider.fetchPrizeAllJson();
  //   var jsonObj = json.decode(response.body);
  //   //print(jsonObj);
  //   var prizeModel = PrizeModel.fromJson(jsonObj);
  //   //  print(homeModel);
  //   // print("prize Model : ");
  //   // print(prizeModel);
  //   return prizeModel;
  // }

  Future<TaskApiResponse> getTaskPage({String token}) async {
    var response = await dataProvider.fetchTaskPageJson(token);
    var jsonObj = json.decode(response.body);
    print(jsonObj);
    var taskPageModel = TaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("task Model : ");
    print(taskPageModel);
    return taskPageModel;
  }

  // Future<WheelApiResponse> getWheelPrizes() async {
  //   var response = await dataProvider.fetchWheelPageJson();
  //   var jsonObj = json.decode(response.body);
  //   // print(jsonObj);
  //   var wheelPageModel = WheelApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   // print("prize Model : ");
  //   // print(wheelPageModel);
  //   return wheelPageModel;
  // }
  //
  // Future<WheelApiResponse> getPremiumWheelPrizes() async {
  //   var response = await dataProvider.fetchPremiumWheelPageJson();
  //   var jsonObj = json.decode(response.body);
  //   // print(jsonObj);
  //   var wheelPageModel = WheelApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   // print("prize Model : ");
  //   // print(wheelPageModel);
  //   return wheelPageModel;
  // }
  //
  // Future<BonusApiResponse> getBonusPrizes() async {
  //   var response = await dataProvider.fetchBonusJson();
  //   var jsonObj = json.decode(response.body);
  //   // print(jsonObj);
  //   var bonusModel = BonusApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   // print("prize Model : ");
  //   // print(bonusModel);
  //   return bonusModel;
  // }
  //
  // Future<BonusApiResponse> getPremiumBonusPrizes() async {
  //   var response = await dataProvider.fetchPremiumBonusJson();
  //   var jsonObj = json.decode(response.body);
  //   // print(jsonObj);
  //   var bonusModel = BonusApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   // print("prize Model : ");
  //   // print(wheelPageModel);
  //   return bonusModel;
  // }
  //
  // Future<CustomerPrizeApiResponse> addBonusPrizes({int prizeId}) async {
  //   var response = await dataProvider.fetchAddDailyBonus(prizeId: prizeId);
  //   var jsonObj = json.decode(response.body);
  //
  //   var customerPrizeModel = CustomerPrizeApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   // print("customerPrizeModel : ");
  //   // print(customerPrizeModel);
  //   return customerPrizeModel;
  // }
  //
  // Future<CustomerPrizeApiResponse> addLuckyPrizes({int prizeId}) async {
  //   var response = await dataProvider.fetchAddLucky(prizeId: prizeId);
  //   var jsonObj = json.decode(response.body);
  //
  //   var customerPrizeModel = CustomerPrizeApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   // print("customerPrizeModel : ");
  //   print(customerPrizeModel);
  //   return customerPrizeModel;
  // }
}
