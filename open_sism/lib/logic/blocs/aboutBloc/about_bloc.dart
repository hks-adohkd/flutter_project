import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/data_layer/Repositories/app_repo.dart';
import 'package:open_sism/data_layer/Repositories/contact_us_repo.dart';
import 'package:open_sism/data_layer/Repositories/user_repo.dart';
import 'package:open_sism/logic/cubits/internet_cubit.dart';
import 'package:open_sism/logic/cubits/internet_state.dart';
import '../../../presentation/screens/activity/message/components/build_message.dart';
import '../../../presentation/screens/activity/message/components/build_message.dart';
import 'about.dart';
import 'package:open_sism/data_layer/model/about/about_api_response.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/components/about_us_boundle.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final AppRepository appRepository;
  final UserRepository userRepository;
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  bool isConnected;
  List<ContactUsList> contactUsList;
  List<Video> videos;
  List<ContactsDetails> details;
  AboutApiResponse aboutPageModel;
  AboutBloc(
      {@required this.appRepository,
      @required this.internetCubit,
      @required this.userRepository})
      : assert(appRepository != null && internetCubit != null),
        super(AboutInitial()) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetDisconnected) {
        isConnected = false;
      } else if (internetState is InternetConnected &&
          !(state is AboutInitial)) {
        this.add(AboutDataRequested());
        isConnected = true;
      } else if (internetState is InternetLoading) {}
    });
  }

  Future<String> getContact(List<ContactsDetails> details, String value) async {
    ContactsDetails detail = details.firstWhere(
        (element) => value.contains(element.name),
        orElse: () => ContactsDetails(value: " "));
    String names = detail.value;
    return names;
  }

  Future<String> getEmail(List<ContactsDetails> details) async {
    String emailAddress = await details
        .firstWhere((element) => "email".contains(element.name))
        .value;
    if (emailAddress.isNotEmpty) {
      return emailAddress;
    } else
      return " ";
  }

  Future<String> getFacebook(List<ContactsDetails> details) async {
    String names = await details
        .firstWhere((element) => "facebook".contains(element.name))
        .value;
    if (names.isNotEmpty) {
      return names;
    } else
      return " ";
  }

  Future<String> getYoutube(List<ContactsDetails> details) async {
    String names = await details
        .firstWhere((element) => "youtube".contains(element.name))
        .value;
    if (names.isNotEmpty) {
      return names;
    } else
      return " ";
  }

  Future<String> getInstgram(List<ContactsDetails> details) async {
    String names = await details
        .firstWhere((element) => "instagram".contains(element.name))
        .value;
    if (names.isNotEmpty) {
      return names;
    } else
      return " ";
  }

  String getWhatsApp(List<ContactsDetails> details) {
    // orElse: () => ''
    ContactsDetails detail = details.firstWhere(
        (element) => "whats".contains(element.name),
        orElse: () => ContactsDetails(value: " "));
    String names = detail.value;
    return names;
  }

  Future<String> getTelegram(List<ContactsDetails> details) async {
    String names = await details
        .firstWhere((element) => "telegram".contains(element.name))
        .value;
    if (names.isNotEmpty) {
      return names;
    } else
      return " ";
  }

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if (event is AboutPageRequested || event is AboutDataRequested) {
      yield AboutLoadInProgress();
      print("about us ");
      try {
        // print(await appRepository.getAboutData());
        aboutPageModel = await appRepository.getAboutData(
            token: await userRepository.getToken());
        videos = aboutPageModel.content.videos
            .map(
              (item) => Video(
                title: aboutPageModel
                    .content
                    .videos[aboutPageModel.content.videos.indexOf(item)]
                    .displayName,
                url: aboutPageModel.content
                    .videos[aboutPageModel.content.videos.indexOf(item)].value,
                thumbnail: aboutPageModel.content
                    .videos[aboutPageModel.content.videos.indexOf(item)].icon,
              ),
            )
            .toList();

        details = aboutPageModel.content.contacts
            .map(
              (item) => ContactsDetails(
                name: aboutPageModel
                    .content
                    .contacts[aboutPageModel.content.contacts.indexOf(item)]
                    .displayName,
                value: aboutPageModel
                    .content
                    .contacts[aboutPageModel.content.contacts.indexOf(item)]
                    .value,
              ),
            )
            .toList();
        // getPhone(details);
        yield AboutLoadedSuccess(
            phone: await getContact(details, "phone"),
            email: await getContact(details, "email"),
            youtube: await getContact(details, "youtube"),
            faceBook: await getContact(details, "facebook"),
            whats: await getContact(details, "whats"),
            instagram: await getContact(details, "instagram"),
            telegram: await getContact(details, "telegram"),
            aboutData: aboutPageModel,
            videoList: videos);
      } catch (Exception) {
        yield AboutLoadFailure(aboutStoredData: aboutPageModel);
      }
    }
  }
}
