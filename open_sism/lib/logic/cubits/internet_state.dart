import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/api/api_data_provider.dart';

@immutable
abstract class InternetState{}

class InternetLoading extends InternetState{}

class InternetConnected extends InternetState{
  InternetConnected() : super();
}

class InternetDisconnected extends InternetState{

}