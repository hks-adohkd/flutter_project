import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/customer_task/customer_task_api_response.dart';
import 'package:open_sism/data_layer/model/sport_match/match_api_response.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/data_layer/model/quiz/quiz_api_response.dart';
import 'package:open_sism/data_layer/model/task/task_api_response.dart';
import 'package:open_sism/data_layer/model/task/single_task_api_response.dart';

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
    //print(jsonObj);
    var taskPageModel = TaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("task Model : ");
    // print(taskPageModel);
    return taskPageModel;
  }

  Future<QuizApiResponse> getQuizPage({String token, int taskId}) async {
    var response =
        await dataProvider.fetchQuizAll(token: token, taskId: taskId);
    var jsonObj = json.decode(response.body);
    print(jsonObj);
    var quizPageModel = QuizApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("quizPageModel : ");
    print(quizPageModel);
    return quizPageModel;
  }

  Future<SingleTaskApiResponse> getSingleTask(
      {@required String token, @required String taskId}) async {
    var response =
        await dataProvider.fetchSingleTaskJson(token: token, taskId: taskId);
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var taskPageModel = SingleTaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("single task Model : ");
    print(taskPageModel);
    return taskPageModel;
  }

  Future<TaskApiResponse> getCustomerFinishedTask({String token}) async {
    var response = await dataProvider.fetchCustomerFinishedTaskJson(token);
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var taskPageModel = TaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("task Model : ");
    // print(taskPageModel);
    return taskPageModel;
  }

  Future<MatchApiResponse> getMatch(
      {@required String token, @required String taskId}) async {
    var response =
        await dataProvider.fetchMatchJson(token: token, taskId: taskId);
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var matchModel = MatchApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("matchModel Model : ");
    print(matchModel);
    return matchModel;
  }

  Future<CustomerTaskApiResponse> addMatchEnd(
      {@required String token,
      @required String matchId,
      @required String firstTeamScore,
      @required secondTeamScore}) async {
    var response = await dataProvider.fetchAddMatchEndJson(
        token: token,
        firstTeamScore: int.parse(firstTeamScore),
        matchId: int.parse(matchId),
        secondTeamScore: int.parse(secondTeamScore));
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var customerTaskModel = CustomerTaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("customerTaskModel : ");
    print(customerTaskModel);
    return customerTaskModel;
  }

  Future<CustomerTaskApiResponse> addQuizEnd(
      {@required String token,
      @required int taskId,
      String description}) async {
    var response = await dataProvider.fetchAddEndQuiz(
        token: token, appTaskId: taskId, description: description);
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var customerTaskModel = CustomerTaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("customerTaskModel : ");
    print(customerTaskModel);
    return customerTaskModel;
  }

  Future<CustomerTaskApiResponse> addQuizPause({
    @required String token,
    @required int taskId,
    @required int index,
    @required int points,
  }) async {
    var response = await dataProvider.fetchAddPauseQuiz(
        token: token, appTaskId: taskId, points: points, index: index);
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var customerTaskModel = CustomerTaskApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("customerTaskModel : ");
    print(customerTaskModel);
    return customerTaskModel;
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
