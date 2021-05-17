import 'dart:convert';

import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/home_api_response.dart';

class HomeRepository{
  final OpenSismApiDataProvider dataProvider= new OpenSismApiDataProvider();

  Future<HomeApiResponse> getHomeData() async {
    var response = await dataProvider.fetchHomeJson();

    var homeModel = HomeApiResponse.fromJson(json.decode(response.body));

    return homeModel;
  }

}