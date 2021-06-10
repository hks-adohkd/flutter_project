import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_api_response.dart';

import '../../../presentation/screens/activity/message/components/build_message.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object> get props => [];
}

class ContactUSInitial extends ContactUsState {}

class ContactUSLoadInProgress extends ContactUsState {}

class ContactUSLoadedSuccess extends ContactUsState {
  final ContactUSApiResponse contactData;
  final List<ContactUsList> contactUsList;
  const ContactUSLoadedSuccess({@required this.contactData, this.contactUsList})
      : assert(contactData != null);

  @override
  List<Object> get props => [contactData];
}

class ContactUSLoadFailure extends ContactUsState {
  final ContactUSApiResponse contactStoredData;
  ContactUSLoadFailure({@required this.contactStoredData});
}
//
