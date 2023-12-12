import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@Freezed(toJson: false)
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String email,
    required String password,
    required String name,
    required String role,
    required String avatar,
  }) = _UseEntity;
  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
