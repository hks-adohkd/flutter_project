import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_sism/data_layer/api/api_constants.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'package:http/http.dart' as http;

final Map data = {
  "page": 1,
  "limit": 100,
};

final Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept-Language": "en",
  "App-Version": "1.0.0",
  "Platform": "Android",
};

final String body = json.encode(data);

final String domain = API_Domain;

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivtiyStreamSubscription;

  InternetCubit({@required this.connectivity}) : super(InternetLoading()) {
    print("cubit initialized");

    connectivtiyStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected();

        var url = domain + HOME_PAGE;
        headers["Authorization"] = 'Bearer $TEST_TOKEN';
        var response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: body,
        );

        print(response.body);
        print(response.statusCode);
        print(response.headers);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      } else {
        print("Unknown Reason for Disconnection!!!");
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected() => emit(InternetConnected());

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivtiyStreamSubscription.cancel();
    return super.close();
  }
}
