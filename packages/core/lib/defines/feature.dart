part of '_defines.dart';

typedef FutureEither<T> = FutureOr<EitherFailure<T>>;
typedef FutureVoid = FutureEither<void>;
