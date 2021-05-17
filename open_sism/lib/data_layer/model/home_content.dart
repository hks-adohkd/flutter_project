import 'package:equatable/equatable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:json_annotation/json_annotation.dart';

import 'content_model.dart';

part 'home_content.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeContent extends Equatable{
  final List<Content> slides;
  final List<Content> banner;
  final bool luckyWheelValid;
  final bool dailyBonusValid;
  final int newMessages;


  HomeContent({this.slides, this.banner, this.luckyWheelValid,
      this.dailyBonusValid, this.newMessages});

  factory HomeContent.fromJson(Map<String, dynamic> json) => _$HomeContentFromJson(json);

  Map<String, dynamic> toJson() => _$HomeContentToJson(this);

  @override
  List<Object> get props => [slides, banner, luckyWheelValid, dailyBonusValid, newMessages];
}
