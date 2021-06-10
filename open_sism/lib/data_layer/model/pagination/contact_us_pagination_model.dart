import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:open_sism/data_layer/model/contactUS/contactUS_model.dart';
import 'package:open_sism/data_layer/model/pagination/pagination_model.dart';

part 'contact_us_pagination_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactUSPaginationModel extends Equatable {
  PaginationModel pagination;
  List<ContactUS> content;
  ContactUSPaginationModel({this.content, this.pagination});

  factory ContactUSPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUSPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUSPaginationModelToJson(this);

  @override
  List<Object> get props => [pagination, content];
}
