import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:go_money/core/domain/repositories/token_repository.dart';

///
class AuthInterceptor implements RequestInterceptor {
  ///
  const AuthInterceptor(this._repo);

  final TokenRepository _repo;

  @override
  FutureOr<Request> onRequest(Request request) {
    final token = _repo.token();
    final updatedRequest = applyHeader(
      request,
      HttpHeaders.authorizationHeader,
      'Bearer ${token.getOrElse((l) => '')}',
      // Do not override existing header
      override: false,
    );

    log(
      '[AuthInterceptor] accessToken: ${updatedRequest.headers[HttpHeaders.authorizationHeader]}',
    );

    return updatedRequest;
  }
}
