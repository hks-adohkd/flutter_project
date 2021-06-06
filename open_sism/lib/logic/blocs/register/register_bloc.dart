import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:open_sism/logic/blocs/app/app_bloc.dart';
import 'package:open_sism/data_layer/model/customer/customer_response_model.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/blocs/app/app_event.dart';
import 'package:open_sism/logic/blocs/register/register_event.dart';
import 'package:open_sism/logic/blocs/register/register_state.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AppBloc appBloc;
  final InternetCubit internetCubit;
  bool isConnected;
  StreamSubscription internetStreamSubscription;
  RegisterBloc({this.userRepository, this.appBloc, this.internetCubit})
      : assert(appBloc != null && userRepository != null),
        super(InitialRegisterState()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is InitialRegisterState)) {
        // this.add(LoginInitial());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  // @override
  // RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      //  String mobile = event.mobile.replaceFirst("+", '');
      print('mobile will be ${event.mobile}');

      if (event.password.isEmpty ||
          event.firstName.isEmpty ||
          event.lastName.isEmpty ||
          event.mobile.isEmpty ||
          event.gender == null) {
        yield RegisterNotValidFormState();
      } else {
        try {
          String email =
              (event.email.isEmpty || event.email == null) ? "" : event.email;
          String mobile = event.mobile; //.replaceFirst("+", '');
          print('valid mobile will be $mobile');
          CustomerApiResponse user =
              await userRepository.registerWithCredentials(
            mobile: mobile,
            firstName: event.firstName,
            lastName: event.lastName,
            email: event.email,
            password: event.password,
            gender: event.gender,
            passwordConfirm: event.passwordConfirm,
          );
          if (user.message == "success") {
            appBloc.add(LogIn(token: user.currentCustomer.token));
            yield RegisterSuccessState();
          } else
            yield RegisterMessageNotSuccess(user.message);
        } catch (e) {
          yield RegisterErrorState(e);
          print('Error is: $e');
        }
      }
    }
  }
}
