import 'dart:convert';

import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryEntity {
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);

  static const toJsonFactory = _$CategoryEntityToJson;
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  static const fromJsonFactory = _$CategoryEntityFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryEntity &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) || const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) || const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ const DeepCollectionEquality().hash(image) ^ runtimeType.hashCode;
}
