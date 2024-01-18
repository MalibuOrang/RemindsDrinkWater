import 'package:json_annotation/json_annotation.dart';
part 'water_day_model.g.dart';

@JsonSerializable()
class WaterDaysModel {
  WaterDaysModel(
      {required this.amount, required this.userId, required this.timestamp});
  final double amount;
  @JsonKey(name: 'user_id')
  final String userId;
  final DateTime timestamp;
  factory WaterDaysModel.fromJson(Map<String, dynamic> json) =>
      _$WaterDaysModelFromJson(json);

  Map<String, dynamic> toJson() => _$WaterDaysModelToJson(this);
}
