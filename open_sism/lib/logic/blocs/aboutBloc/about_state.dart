import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/about/about_api_response.dart';
import 'package:open_sism/presentation/screens/profile/aboutus_screen/components/about_us_boundle.dart';

import '../../../presentation/screens/activity/message/components/build_message.dart';

abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

class AboutInitial extends AboutState {}

class AboutLoadInProgress extends AboutState {}

class AboutLoadedSuccess extends AboutState {
  final AboutApiResponse aboutData;
  final List<Video> videoList;
  final String phone;
  final String email;
  final String youtube;
  final String whats;
  final String faceBook;
  final String telegram;
  final String instagram;
  const AboutLoadedSuccess(
      {@required this.aboutData,
      this.videoList,
      this.phone,
      this.email,
      this.instagram,
      this.youtube,
      this.faceBook,
      this.telegram,
      this.whats})
      : assert(aboutData != null);

  @override
  List<Object> get props => [aboutData];
}

class AboutLoadFailure extends AboutState {
  final AboutApiResponse aboutStoredData;
  AboutLoadFailure({@required this.aboutStoredData});
}
//
