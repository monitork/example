part of 'extensions.dart';

///
extension Iterable2Extension on Iterable<int> {
  ///
  int getMax() => reduce(math.max);

  ///
  int getMin() => reduce(math.min);
}
