// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

part 'platzi_api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateProductDto {
  const CreateProductDto({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.images,
  });

  factory CreateProductDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProductDtoFromJson(json);

  static const toJsonFactory = _$CreateProductDtoToJson;
  Map<String, dynamic> toJson() => _$CreateProductDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'categoryId')
  final double categoryId;
  @JsonKey(name: 'images')
  final String images;
  static const fromJsonFactory = _$CreateProductDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateProductDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(images) ^
      runtimeType.hashCode;
}

extension $CreateProductDtoExtension on CreateProductDto {
  CreateProductDto copyWith(
      {String? title,
      double? price,
      String? description,
      double? categoryId,
      String? images}) {
    return CreateProductDto(
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        images: images ?? this.images);
  }

  CreateProductDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<double>? price,
      Wrapped<String>? description,
      Wrapped<double>? categoryId,
      Wrapped<String>? images}) {
    return CreateProductDto(
        title: (title != null ? title.value : this.title),
        price: (price != null ? price.value : this.price),
        description:
            (description != null ? description.value : this.description),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        images: (images != null ? images.value : this.images));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateProductDto {
  const UpdateProductDto({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.images,
  });

  factory UpdateProductDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductDtoFromJson(json);

  static const toJsonFactory = _$UpdateProductDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateProductDtoToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'categoryId')
  final double categoryId;
  @JsonKey(name: 'images')
  final String images;
  static const fromJsonFactory = _$UpdateProductDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateProductDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(images) ^
      runtimeType.hashCode;
}

extension $UpdateProductDtoExtension on UpdateProductDto {
  UpdateProductDto copyWith(
      {String? title,
      double? price,
      String? description,
      double? categoryId,
      String? images}) {
    return UpdateProductDto(
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        images: images ?? this.images);
  }

  UpdateProductDto copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<double>? price,
      Wrapped<String>? description,
      Wrapped<double>? categoryId,
      Wrapped<String>? images}) {
    return UpdateProductDto(
        title: (title != null ? title.value : this.title),
        price: (price != null ? price.value : this.price),
        description:
            (description != null ? description.value : this.description),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        images: (images != null ? images.value : this.images));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateUserDto {
  const CreateUserDto({
    required this.email,
    required this.name,
    required this.password,
    required this.role,
    required this.avatar,
  });

  factory CreateUserDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDtoFromJson(json);

  static const toJsonFactory = _$CreateUserDtoToJson;
  Map<String, dynamic> toJson() => _$CreateUserDtoToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'role')
  final String role;
  @JsonKey(name: 'avatar')
  final String avatar;
  static const fromJsonFactory = _$CreateUserDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateUserDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $CreateUserDtoExtension on CreateUserDto {
  CreateUserDto copyWith(
      {String? email,
      String? name,
      String? password,
      String? role,
      String? avatar}) {
    return CreateUserDto(
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
        role: role ?? this.role,
        avatar: avatar ?? this.avatar);
  }

  CreateUserDto copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? name,
      Wrapped<String>? password,
      Wrapped<String>? role,
      Wrapped<String>? avatar}) {
    return CreateUserDto(
        email: (email != null ? email.value : this.email),
        name: (name != null ? name.value : this.name),
        password: (password != null ? password.value : this.password),
        role: (role != null ? role.value : this.role),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class ValidateUserDto {
  const ValidateUserDto({
    required this.email,
  });

  factory ValidateUserDto.fromJson(Map<String, dynamic> json) =>
      _$ValidateUserDtoFromJson(json);

  static const toJsonFactory = _$ValidateUserDtoToJson;
  Map<String, dynamic> toJson() => _$ValidateUserDtoToJson(this);

  @JsonKey(name: 'email')
  final String email;
  static const fromJsonFactory = _$ValidateUserDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateUserDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ValidateUserDtoExtension on ValidateUserDto {
  ValidateUserDto copyWith({String? email}) {
    return ValidateUserDto(email: email ?? this.email);
  }

  ValidateUserDto copyWithWrapped({Wrapped<String>? email}) {
    return ValidateUserDto(email: (email != null ? email.value : this.email));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateUserDto {
  const UpdateUserDto({
    required this.email,
    required this.name,
    required this.password,
    required this.role,
    required this.avatar,
  });

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDtoFromJson(json);

  static const toJsonFactory = _$UpdateUserDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateUserDtoToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'role')
  final String role;
  @JsonKey(name: 'avatar')
  final String avatar;
  static const fromJsonFactory = _$UpdateUserDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateUserDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(avatar) ^
      runtimeType.hashCode;
}

extension $UpdateUserDtoExtension on UpdateUserDto {
  UpdateUserDto copyWith(
      {String? email,
      String? name,
      String? password,
      String? role,
      String? avatar}) {
    return UpdateUserDto(
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
        role: role ?? this.role,
        avatar: avatar ?? this.avatar);
  }

  UpdateUserDto copyWithWrapped(
      {Wrapped<String>? email,
      Wrapped<String>? name,
      Wrapped<String>? password,
      Wrapped<String>? role,
      Wrapped<String>? avatar}) {
    return UpdateUserDto(
        email: (email != null ? email.value : this.email),
        name: (name != null ? name.value : this.name),
        password: (password != null ? password.value : this.password),
        role: (role != null ? role.value : this.role),
        avatar: (avatar != null ? avatar.value : this.avatar));
  }
}

@JsonSerializable(explicitToJson: true)
class RefreshTokenDto {
  const RefreshTokenDto({
    required this.refreshToken,
  });

  factory RefreshTokenDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDtoFromJson(json);

  static const toJsonFactory = _$RefreshTokenDtoToJson;
  Map<String, dynamic> toJson() => _$RefreshTokenDtoToJson(this);

  @JsonKey(name: 'refreshToken')
  final String refreshToken;
  static const fromJsonFactory = _$RefreshTokenDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshTokenDto &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(refreshToken) ^ runtimeType.hashCode;
}

extension $RefreshTokenDtoExtension on RefreshTokenDto {
  RefreshTokenDto copyWith({String? refreshToken}) {
    return RefreshTokenDto(refreshToken: refreshToken ?? this.refreshToken);
  }

  RefreshTokenDto copyWithWrapped({Wrapped<String>? refreshToken}) {
    return RefreshTokenDto(
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken));
  }
}

@JsonSerializable(explicitToJson: true)
class LoginDto {
  const LoginDto({
    required this.email,
    required this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  static const fromJsonFactory = _$LoginDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith({String? email, String? password}) {
    return LoginDto(
        email: email ?? this.email, password: password ?? this.password);
  }

  LoginDto copyWithWrapped(
      {Wrapped<String>? email, Wrapped<String>? password}) {
    return LoginDto(
        email: (email != null ? email.value : this.email),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class CreateCategoryDto {
  const CreateCategoryDto({
    required this.name,
    required this.image,
  });

  factory CreateCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDtoFromJson(json);

  static const toJsonFactory = _$CreateCategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CreateCategoryDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  static const fromJsonFactory = _$CreateCategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateCategoryDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      runtimeType.hashCode;
}

extension $CreateCategoryDtoExtension on CreateCategoryDto {
  CreateCategoryDto copyWith({String? name, String? image}) {
    return CreateCategoryDto(
        name: name ?? this.name, image: image ?? this.image);
  }

  CreateCategoryDto copyWithWrapped(
      {Wrapped<String>? name, Wrapped<String>? image}) {
    return CreateCategoryDto(
        name: (name != null ? name.value : this.name),
        image: (image != null ? image.value : this.image));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateCategoryDto {
  const UpdateCategoryDto({
    required this.name,
    required this.image,
  });

  factory UpdateCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryDtoFromJson(json);

  static const toJsonFactory = _$UpdateCategoryDtoToJson;
  Map<String, dynamic> toJson() => _$UpdateCategoryDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  static const fromJsonFactory = _$UpdateCategoryDtoFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateCategoryDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      runtimeType.hashCode;
}

extension $UpdateCategoryDtoExtension on UpdateCategoryDto {
  UpdateCategoryDto copyWith({String? name, String? image}) {
    return UpdateCategoryDto(
        name: name ?? this.name, image: image ?? this.image);
  }

  UpdateCategoryDto copyWithWrapped(
      {Wrapped<String>? name, Wrapped<String>? image}) {
    return UpdateCategoryDto(
        name: (name != null ? name.value : this.name),
        image: (image != null ? image.value : this.image));
  }
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
