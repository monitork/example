part of 'extensions.dart';

///
extension IterableExtension on Iterable<int> {
  ///
  int getMax() => reduce(math.max);

  ///
  int getMin() => reduce(math.min);
}
