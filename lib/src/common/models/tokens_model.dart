import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'tokens_model.g.dart';

// Данный класс является моделью данных, которые мы получили с сервера
// После получения ответа от сервера, мы будем работать именно с этим классом

// Добавили аннотацию
@JsonSerializable()
class TokensModel{
  @JsonKey(name: 'accessToken')
  final String? access;
  @JsonKey(name: 'refreshToken')
  final String? refresh;

  TokensModel({
    required this.access,
    required this.refresh,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) => _$TokensModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokensModelToJson(this);
}