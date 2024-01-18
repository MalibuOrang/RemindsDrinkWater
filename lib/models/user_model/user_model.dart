import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UsersModel {
  UsersModel(
      {required this.lastLogin,
      required this.userId,
      required this.waterPerDay});
  @JsonKey(name: 'last_login')
  final DateTime lastLogin;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'water_perDay')
  final int waterPerDay;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
