import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_model.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';

class ContactUSRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<ContactUSApiResponse> getContactUSPage({String token}) async {
    var response = await dataProvider.fetchContactUSPageJson(token);
    var jsonObj = json.decode(response.body);
    print(jsonObj);
    var contactUSPageModel = ContactUSApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    print("contactUSPageModel Model : ");
    print(contactUSPageModel);
    return contactUSPageModel;
  }

  // Future<TaskApiResponse> getCustomerFinishedTask({String token}) async {
  //   var response = await dataProvider.fetchCustomerFinishedTaskJson(token);
  //   var jsonObj = json.decode(response.body);
  //   print(jsonObj);
  //   var taskPageModel = TaskApiResponse.fromJson(jsonObj);
  //   // //  print(homeModel);
  //   print("task Model : ");
  //   print(taskPageModel);
  //   return taskPageModel;
  // }

}
