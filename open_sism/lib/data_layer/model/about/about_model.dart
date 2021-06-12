import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/content/content_model.dart';
import 'package:open_sism/data_layer/model/contact/contact_model.dart';

part 'about_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AboutContent extends Equatable {
  final List<Contact> videos;
  final List<Contact> contacts;
  final Contact location;
  final Content aboutUs;

  AboutContent({
    this.videos,
    this.contacts,
    this.location,
    this.aboutUs,
  });

  factory AboutContent.fromJson(Map<String, dynamic> json) =>
      _$AboutContentFromJson(json);

  Map<String, dynamic> toJson() => _$AboutContentToJson(this);

  @override
  List<Object> get props => [
        contacts,
        videos,
        location,
        aboutUs,
      ];
}
