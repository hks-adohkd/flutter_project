import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/prize/prize_api_response.dart';
import 'package:open_sism/data_layer/model/luckyWheel/wheel_api_response.dart';

import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/data_layer/model/prize/prizePage_model.dart';

class PrizeRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<PrizeModel> getPrizeAll() async {
    var response = await dataProvider.fetchPrizeAllJson();
    var jsonObj = json.decode(response.body);
    //print(jsonObj);
    var prizeModel = PrizeModel.fromJson(jsonObj);
    //  print(homeModel);
    print("prize Model : ");
    print(prizeModel);
    return prizeModel;
  }

  Future<PrizeApiResponse> getPrizePage() async {
    var response = await dataProvider.fetchPrizePageJson();
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var prizePageModel = PrizeApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("prize Model : ");
    // print(prizePageModel);
    return prizePageModel;
  }

  Future<WheelApiResponse> getWheelPrizes() async {
    var response = await dataProvider.fetchWheelPageJson();
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var wheelPageModel = WheelApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("prize Model : ");
    // print(wheelPageModel);
    return wheelPageModel;
  }
}
