part of 'extensions.dart';

///
extension StringExtension on String {
  ///
  int toInt() => int.parse(this);

  ///
  double toDouble() => double.parse(this);

  ///
  DateTime toDateTime() => DateTime.parse(this);

  ///
  String pluralize(int len) {
    if (isEmpty) return '';
    if (len == 1) return this;
    if (this[length - 1] == 'y') return '${substring(0, length - 1)}ies';
    return '${this}s';
  }

  ///
  String titleCaseSingle() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  ///
  String defaultOnEmpty([String defaultValue = '']) => isEmpty ? defaultValue : this;

  ///
  Future<void> launchAsUrl() async {
    try {
      if (await canLaunch(this)) {
        launch(this);
      }
    } catch (e) {
      return;
    }
  }
}
