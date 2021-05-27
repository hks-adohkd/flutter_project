import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/prize_model.dart';

class PrizeRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<PrizeModel> getPrizeAll() async {
    var response = await dataProvider.fetchPrizeAllJson();
    var jsonObj = json.decode(response.body);
    print(jsonObj);
    //var prizeModel = PrizeModel.fromJson(jsonObj);
    //  print(homeModel);
    //  print(homeModel);
    return null;
  }
}
