import 'dart:async';
import 'package:open_sism/data_layer/model/prize/prize_model.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/data_layer/model/customer/customer_response_model.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/logic/blocs/login/login_event.dart';
import 'package:open_sism/logic/blocs/login/login_state.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import 'dart:async';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AppBloc appBloc;
  final InternetCubit internetCubit;
  bool isConnected;
  StreamSubscription internetStreamSubscription;

  LoginBloc(
      {@required this.appBloc,
      @required this.userRepository,
      this.internetCubit})
      : assert(appBloc != null && userRepository != null),
        super(InitialState()) {
    // internetStreamSubscription = internetCubit.stream.listen((internetState) {
    //   if (internetState is InternetDisconnected) {
    //     isConnected = false;
    //   } else if (internetState is InternetConnected &&
    //       !(state is InitialState)) {
    //     this.add(LoginInitial());
    //     isConnected = true;
    //   } else if (internetState is InternetLoading) {}
    // });
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      if (event.password.isEmpty || event.mobile.isEmpty) {
        yield LoginFailed('قم بإدخال اسم المستخدم وكلمة المرور!');
      } else {
        yield LoginLoading();
        try {
          // PrizeModel prize = await userRepository.getPrizeAll();
          CustomerApiResponse user = await userRepository.signInWithCredentials(
            event.mobile,
            event.password,
            "",
          );

          print({"token", user.currentCustomer.token});

          appBloc.add(LogIn(token: user.currentCustomer.token));
          yield LoginSuccess();
        } catch (e) {
          String msg = 'Error';
          if (e['code'] == 1) {
            msg = 'رقم جوال أو كلمة سر غير صحيحين';
          }
          yield LoginFailed(msg);
        }
      }
    }

    if (event is LoginInitial) {
      yield InitialState();
    }
  }
}
