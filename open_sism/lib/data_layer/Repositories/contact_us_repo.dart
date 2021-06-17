import 'dart:convert';

import 'package:http/http.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_model.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';
import 'package:open_sism/data_layer/model/contactUS/support_message_api_response.dart';

class ContactUSRepository {
  final OpenSismApiDataProvider dataProvider = new OpenSismApiDataProvider();

  Future<ContactUSApiResponse> getContactUSPage({String token}) async {
    // print("fetch");
    var response = await dataProvider.fetchContactUSPageJson(token);
    // print("response");
    // print(response.body);
    var jsonObj = json.decode(response.body);
    //  print(jsonObj);
    var contactUSPageModel = ContactUSApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("contactUSPageModel Model : ");
    // print(contactUSPageModel);
    return contactUSPageModel;
  }

  Future<SupportMessageApiResponse> addSupportMessage(
      {String token,
      String email,
      String subject,
      String message,
      String phone,
      String firstName,
      String lastName}) async {
    // print("fetch");
    var response = await dataProvider.fetchAddSupportMessageJson(
        lastName: lastName,
        firstName: firstName,
        email: email,
        token: token,
        message: message,
        phone: phone,
        subject: subject);
    // print("response");
    // print(response.body);
    var jsonObj = json.decode(response.body);
    //  print(jsonObj);
    var supportMessageResponse = SupportMessageApiResponse.fromJson(jsonObj);
    // //  print(homeModel);
    // print("contactUSPageModel Model : ");
    // print(contactUSPageModel);
    return supportMessageResponse;
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
