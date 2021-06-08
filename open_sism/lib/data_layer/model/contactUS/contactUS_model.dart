import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contactUS_model.g.dart';

@JsonSerializable()
class ContactUS extends Equatable {
  // Base Entity Model
  final int id;
  final DateTime created;
  final DateTime modified;
  final bool isDeleted;

  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String subject;
  final String message;
  final String featuredSubject;
  final String replay;
  final String featuredReplay;
  final bool isFeatured;
  final bool isViewed;
  final int customerId;

  ContactUS({
    this.id,
    this.created,
    this.modified,
    this.isDeleted,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.message,
    this.customerId,
    this.featuredReplay,
    this.featuredSubject,
    this.isFeatured,
    this.isViewed,
    this.lastName,
    this.replay,
    this.subject,
  });

  factory ContactUS.fromJson(Map<String, dynamic> json) =>
      _$ContactUSFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUSToJson(this);

  @override
  List<Object> get props => [
        id,
        created,
        modified,
        isDeleted,
        replay,
        lastName,
        isViewed,
        customerId,
        message,
        lastName,
        email,
        subject,
        phoneNumber,
      ];
}
