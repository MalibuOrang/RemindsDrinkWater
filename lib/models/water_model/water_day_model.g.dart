// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterDaysModel _$WaterDaysModelFromJson(Map<String, dynamic> json) =>
    WaterDaysModel(
      amount: (json['amount'] as num).toDouble(),
      userId: json['user_id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$WaterDaysModelToJson(WaterDaysModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'user_id': instance.userId,
      'timestamp': instance.timestamp.toIso8601String(),
    };
