import 'dart:convert';

import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  const CategoryDto({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  static const toJsonFactory = _$CategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  static const fromJsonFactory = _$CategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryDto &&
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
