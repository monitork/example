import 'package:flutter/material.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:validators/validators.dart';

/// Shorthand type for validator function
typedef ValidatorFunction = String? Function(String?);

/// Form validator mixin
mixin FormValidator<T extends StatefulWidget> on State<T> {
  /// Key for the form validation using this mixin
  final formKey = GlobalKey<FormState>();

  /// Determines whether errors should be displayed on UI
  /// If an error is displayed and user starts typing, error should disappear until the next validation
  bool shouldValidate = false;

  /// Prevent validation until main form button is pressed
  void stopValidating() {
    if (shouldValidate) {
      setState(() {
        shouldValidate = false;
      });
    }
  }

  /// Email field validator. Should be a valid non-empty email
  // TODO(Whoever works on email fields) replace this with a valueObject (example - name validator)
  String? emailValidator(String? value) {
    if (!shouldValidate) return null;
    final trimmedValue = value?.trim() ?? '';
    if (!isEmail(trimmedValue)) {
      return context.tr.emailInvalid;
    }
    return null;
  }
}
