import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/prize_repository.dart';
import 'package:open_sism/data_layer/Repositories/task_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/data_layer/model/customerPrize/customer_request_prize_api_response.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'requestedPrize_event.dart';
import 'requestedPrize_state.dart';
import 'package:open_sism/data_layer/model/task/task_model.dart';
import 'package:open_sism/presentation/screens/activity/order/components/build_oeder.dart';

class RequestedPrizeBloc
    extends Bloc<RequestedPrizeEvent, RequestedPrizeState> {
  final PrizeRepository prizeRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  List<OrderList> orderList;
  CustomerRequestPrizeApiResponse requestedPrizePageModel;
  RequestedPrizeBloc(
      {@required this.prizeRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(prizeRepository != null && internetCubit != null),
        super(RequestedPrizeInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is RequestedPrizeInitial)) {
        this.add(RequestedPrizeDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  @override
  Stream<RequestedPrizeState> mapEventToState(
      RequestedPrizeEvent event) async* {
    if (event is RequestedPrizePageRequested ||
        event is RequestedPrizeDataRequested) {
      yield RequestedPrizeLoadInProgress();

      try {
        requestedPrizePageModel = await prizeRepository.getOrderedCustomerPrize(
            token: await userRepository.getToken());

        orderList = requestedPrizePageModel.content.content
            .map(
              (item) => OrderList(
                displayName: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prize
                    .displayName,
                points: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prize
                    .points
                    .toString(),
                imgURL: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prize
                    .imageUrl,
                description: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prize
                    .description,
                earnDate: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .earnDate,
                prizeStatusDisplayName: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prizeStatus
                    .displayName,
                prizeStatusName: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prizeStatus
                    .name,
                prizeType: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prize
                    .name,
                requestDate: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .requestDate,
                value: requestedPrizePageModel
                    .content
                    .content[
                        requestedPrizePageModel.content.content.indexOf(item)]
                    .prize
                    .value
                    .toString(),
              ),
            )
            .toList();
        yield RequestedPrizeLoadedSuccess(
            requestedPrizeData: requestedPrizePageModel, orderList: orderList);
      } catch (Exception) {
        yield RequestedPrizeLoadFailure(
            requestedPrizeStoredData: requestedPrizePageModel);
      }
    }
  }
}
