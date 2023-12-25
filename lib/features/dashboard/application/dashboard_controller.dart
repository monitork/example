import 'dart:async';

import 'package:core/core.dart';
import 'package:go_money/features/auth/auth_provider.dart';
import 'package:go_money/features/store/domain/entities/category_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  Future<void> build() async {
    unawaited(_loadCategory());
  }

  Future<void> _loadCategory() async {
    // await ref.read(authRepositoryProvider).doLogin();
  }
}

@riverpod
List<CategoryEntity> appCategory(Ref ref) {
  return CategoryEntity();
}
