import 'dart:convert';

import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/home_api_response.dart';
import 'package:open_sism/data_layer/api/api_constants.dart';

class HomeRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<HomeApiResponse> getHomeData() async {
    var response = await dataProvider.fetchHomeJson(TEST_TOKEN);

    var homeModel = HomeApiResponse.fromJson(json.decode(response.body));
    print(homeModel);
    return homeModel;
  }
}
