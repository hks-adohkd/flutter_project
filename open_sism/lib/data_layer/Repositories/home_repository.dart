import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/home/home_api_response.dart';

class HomeRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<HomeApiResponse> getHomeData({String token}) async {
    var response = await dataProvider.fetchHomeJson(token: token);
    var jsonObj = json.decode(response.body);
    // print(jsonObj);
    var homeModel = HomeApiResponse.fromJson(jsonObj);
    // print(homeModel);
    //  print(homeModel);
    return homeModel;
  }
}
