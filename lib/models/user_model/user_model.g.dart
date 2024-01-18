// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      lastLogin: DateTime.parse(json['last_login'] as String),
      userId: json['user_id'] as String,
      waterPerDay: json['water_perDay'] as int,
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'last_login': instance.lastLogin.toIso8601String(),
      'user_id': instance.userId,
      'water_perDay': instance.waterPerDay,
    };
