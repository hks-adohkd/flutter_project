// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizApiResponse _$QuizApiResponseFromJson(Map<String, dynamic> json) {
  return QuizApiResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    content: json['content'] == null
        ? null
        : QuizPaginationModel.fromJson(json['content'] as Map<String, dynamic>),
    currentCustomer: json['currentCustomer'] == null
        ? null
        : CustomerModel.fromJson(
            json['currentCustomer'] as Map<String, dynamic>),
    quizIndexes: json['quizIndexes'] == null
        ? null
        : IndexModel.fromJson(json['quizIndexes'] as Map<String, dynamic>),
    totalQuestions: json['totalQuestions'] as int,
  );
}

Map<String, dynamic> _$QuizApiResponseToJson(QuizApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'content': instance.content?.toJson(),
      'currentCustomer': instance.currentCustomer?.toJson(),
      'quizIndexes': instance.quizIndexes?.toJson(),
      'totalQuestions': instance.totalQuestions,
    };
