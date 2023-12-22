part of '_provider.dart';

// ignore: invalid_use_of_internal_member
mixin NotifierUpdate<T> on notifier.NotifierBase<T> {
  void update(T Function(T state) cb) => state = cb(state);
}
