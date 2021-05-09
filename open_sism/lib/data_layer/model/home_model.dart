import 'package:open_sism/data_layer/api/api_response.dart';
import 'package:open_sism/data_layer/model/customer_model.dart';

class HomeModel extends ApiResponse{
  Content content;
  CustomerModel currentCustomer;
}

class Slides{

}

class Banner{

}

class Content{
  Slides slides;
  Banner banner;
  bool luckyWheelValid;
  bool dailyBonusValid;
  int newMessages;
}