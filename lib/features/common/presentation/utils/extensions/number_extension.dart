part of 'extensions.dart';

///
extension NumberExtension on num {
  /// interpolate a value from one range to another
  double normalize(
    num min,
    num max, {
    int lowerBound = 0,
    int upperBound = 100,
  }) {
    if (this == 0) return 0;
    return (upperBound - lowerBound) * ((this - min) / (max - min)) + lowerBound;
  }
}
