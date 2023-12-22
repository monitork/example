// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'platzi_api.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
export 'platzi_api.models.swagger.dart';

part 'platzi_api.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class PlatziApi extends ChopperService {
  static PlatziApi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$PlatziApi(client);
    }

    final newClient = ChopperClient(
        services: [_$PlatziApi()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$PlatziApi(newClient);
  }

  ///
  ///@param limit
  ///@param offset
  Future<chopper.Response> apiV1ProductsGet({
    required num? limit,
    required num? offset,
  }) {
    return _apiV1ProductsGet(limit: limit, offset: offset);
  }

  ///
  ///@param limit
  ///@param offset
  @Get(path: '/api/v1/products')
  Future<chopper.Response> _apiV1ProductsGet({
    @Query('limit') required num? limit,
    @Query('offset') required num? offset,
  });

  ///
  Future<chopper.Response> apiV1ProductsPost(
      {required CreateProductDto? body}) {
    return _apiV1ProductsPost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/products',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1ProductsPost(
      {@Body() required CreateProductDto? body});

  ///
  ///@param id
  Future<chopper.Response> apiV1ProductsIdGet({required num? id}) {
    return _apiV1ProductsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/v1/products/{id}')
  Future<chopper.Response> _apiV1ProductsIdGet({@Path('id') required num? id});

  ///
  ///@param id
  Future<chopper.Response> apiV1ProductsIdPut({
    required num? id,
    required UpdateProductDto? body,
  }) {
    return _apiV1ProductsIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/v1/products/{id}',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1ProductsIdPut({
    @Path('id') required num? id,
    @Body() required UpdateProductDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> apiV1ProductsIdDelete({required num? id}) {
    return _apiV1ProductsIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/v1/products/{id}')
  Future<chopper.Response> _apiV1ProductsIdDelete(
      {@Path('id') required num? id});

  ///
  ///@param limit
  Future<chopper.Response> apiV1UsersGet({required num? limit}) {
    return _apiV1UsersGet(limit: limit);
  }

  ///
  ///@param limit
  @Get(path: '/api/v1/users')
  Future<chopper.Response> _apiV1UsersGet(
      {@Query('limit') required num? limit});

  ///
  Future<chopper.Response> apiV1UsersPost({required CreateUserDto? body}) {
    return _apiV1UsersPost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/users',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1UsersPost(
      {@Body() required CreateUserDto? body});

  ///
  ///@param id
  Future<chopper.Response> apiV1UsersIdGet({required num? id}) {
    return _apiV1UsersIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/v1/users/{id}')
  Future<chopper.Response> _apiV1UsersIdGet({@Path('id') required num? id});

  ///
  ///@param id
  Future<chopper.Response> apiV1UsersIdPut({
    required num? id,
    required UpdateUserDto? body,
  }) {
    return _apiV1UsersIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/v1/users/{id}',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1UsersIdPut({
    @Path('id') required num? id,
    @Body() required UpdateUserDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> apiV1UsersIdDelete({required num? id}) {
    return _apiV1UsersIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/v1/users/{id}')
  Future<chopper.Response> _apiV1UsersIdDelete({@Path('id') required num? id});

  ///
  Future<chopper.Response> apiV1UsersIsAvailablePost(
      {required ValidateUserDto? body}) {
    return _apiV1UsersIsAvailablePost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/users/is-available',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1UsersIsAvailablePost(
      {@Body() required ValidateUserDto? body});

  ///
  Future<chopper.Response> apiV1AuthLoginPost({required LoginDto? body}) {
    return _apiV1AuthLoginPost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/auth/login',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1AuthLoginPost(
      {@Body() required LoginDto? body});

  ///
  Future<chopper.Response> apiV1AuthProfileGet() {
    return _apiV1AuthProfileGet();
  }

  ///
  @Get(path: '/api/v1/auth/profile')
  Future<chopper.Response> _apiV1AuthProfileGet();

  ///
  Future<chopper.Response> apiV1AuthRefreshTokenPost(
      {required RefreshTokenDto? body}) {
    return _apiV1AuthRefreshTokenPost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/auth/refresh-token',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1AuthRefreshTokenPost(
      {@Body() required RefreshTokenDto? body});

  ///
  ///@param limit
  Future<chopper.Response> apiV1CategoriesGet({required num? limit}) {
    return _apiV1CategoriesGet(limit: limit);
  }

  ///
  ///@param limit
  @Get(path: '/api/v1/categories')
  Future<chopper.Response> _apiV1CategoriesGet(
      {@Query('limit') required num? limit});

  ///
  Future<chopper.Response> apiV1CategoriesPost(
      {required CreateCategoryDto? body}) {
    return _apiV1CategoriesPost(body: body);
  }

  ///
  @Post(
    path: '/api/v1/categories',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1CategoriesPost(
      {@Body() required CreateCategoryDto? body});

  ///
  ///@param id
  Future<chopper.Response> apiV1CategoriesIdGet({required num? id}) {
    return _apiV1CategoriesIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/api/v1/categories/{id}')
  Future<chopper.Response> _apiV1CategoriesIdGet(
      {@Path('id') required num? id});

  ///
  ///@param id
  Future<chopper.Response> apiV1CategoriesIdPut({
    required num? id,
    required UpdateCategoryDto? body,
  }) {
    return _apiV1CategoriesIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/api/v1/categories/{id}',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1CategoriesIdPut({
    @Path('id') required num? id,
    @Body() required UpdateCategoryDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> apiV1CategoriesIdDelete({required num? id}) {
    return _apiV1CategoriesIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/api/v1/categories/{id}')
  Future<chopper.Response> _apiV1CategoriesIdDelete(
      {@Path('id') required num? id});

  ///
  ///@param id
  ///@param limit
  ///@param offset
  Future<chopper.Response> apiV1CategoriesIdProductsGet({
    required num? id,
    required num? limit,
    required num? offset,
  }) {
    return _apiV1CategoriesIdProductsGet(id: id, limit: limit, offset: offset);
  }

  ///
  ///@param id
  ///@param limit
  ///@param offset
  @Get(path: '/api/v1/categories/{id}/products')
  Future<chopper.Response> _apiV1CategoriesIdProductsGet({
    @Path('id') required num? id,
    @Query('limit') required num? limit,
    @Query('offset') required num? offset,
  });

  ///
  Future<chopper.Response> apiV1FilesUploadPost() {
    return _apiV1FilesUploadPost();
  }

  ///
  @Post(
    path: '/api/v1/files/upload',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1FilesUploadPost();

  ///
  ///@param filename
  Future<chopper.Response> apiV1FilesFilenameGet({required String? filename}) {
    return _apiV1FilesFilenameGet(filename: filename);
  }

  ///
  ///@param filename
  @Get(path: '/api/v1/files/{filename}')
  Future<chopper.Response> _apiV1FilesFilenameGet(
      {@Path('filename') required String? filename});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
