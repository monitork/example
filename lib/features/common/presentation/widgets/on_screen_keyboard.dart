import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:resource/resource.dart';

///
@immutable
class KeyboardState {
  ///
  const KeyboardState({this.text = ''});
  final String text;
}

const double _kPadHeight = 65;

///
class OnScreenKeyboard extends HookConsumerWidget {
  ///
  const OnScreenKeyboard(this.onChange, this.onEnter, {super.key});

  final ValueChanged<double>? onChange;
  final VoidCallback? onEnter;

  static const int _scaleFactor = 2;
  static const int _kMax = 1000000;

  bool _hasReachedMaxAmount(String text, _Key key) {
    final value = key.value;
    if (text.isEmpty || value == '.') return false;
    final amount = key.addAmount ? (text.toDouble() + value.toDouble()).toString() : (text + value);
    return !(amount.toInt() < _kMax);
  }

  bool _canEditText(String text, String value) {
    final dotChar = value == '.';
    // text cannot start with a leading dot
    if (text.isEmpty && dotChar) return false;
    // cannot add zeros to empty text
    if (text.isEmpty && int.tryParse(value) == 0) return false;
    // cannot add another dot if a dot already exist
    if (text.contains('.')) {
      if (dotChar) return false;
      // cannot trailing character greater than the currency's minorUnits
      final minorUnits = text.split('.')[1];
      if (minorUnits.isNotEmpty) {
        if (minorUnits.toInt() >= (_scaleFactor / 10)) return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    KeyboardState reducer(KeyboardState state, _Key? action) {
      if (action is _Key) {
        final updateValue = action.value;
        final oldValue = state.text;
        var newValue = '';

        if (updateValue == 'delete') {
          if (oldValue.isNotEmpty) {
            newValue = oldValue.substring(0, oldValue.length - 1);
            onChange?.call(newValue.isEmpty ? 0 : double.tryParse(newValue) ?? 0);
          }
          return KeyboardState(text: newValue);
        }
        if (_canEditText(oldValue, updateValue) && !_hasReachedMaxAmount(oldValue, action)) {
          if (action.addAmount) {
            newValue = oldValue.isEmpty ? updateValue : (double.parse(updateValue) + double.parse(oldValue)).toString();
          } else {
            newValue = oldValue + updateValue;
          }
        }
        onChange?.call(double.parse(newValue));
        return KeyboardState(text: newValue);
      }
      return state;
    }

    final store = useReducer<KeyboardState, _Key?>(
      reducer,
      initialState: const KeyboardState(),
      initialAction: null,
    );

    return SizedBox(
      height: _kPadHeight * 4 + 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: KeyboardConfigs.quickKeys
                .map(
                  (e) => SizedBox(
                    height: 40,
                    width: context.getWidth(0.33),
                    child: Keypad(
                      _Key('+${e.value}'),
                      color: context.colors.secondary,
                      onTap: () => store.dispatch(e),
                    ),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ...KeyboardConfigs.numberKeys.map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: e
                              .map(
                                (key) => Expanded(
                                  child: SizedBox(
                                    height: _kPadHeight,
                                    child: Keypad(
                                      key,
                                      onTap: () => store.dispatch(key),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: _kPadHeight,
                              child: Keypad(
                                _Key('0'),
                                onTap: () => store.dispatch(_Key('0')),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _kPadHeight,
                            width: context.getWidth(0.224),
                            child: Keypad(
                              _Key('.'),
                              onTap: () => store.dispatch(_Key('.')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: context.getWidth(0.33),
                  child: Column(
                    children: [
                      SizedBox(
                        height: _kPadHeight,
                        child: Keypad(
                          _Key('delete'),
                          onTap: () => store.dispatch(_Key('delete')),
                          color: context.colors.onSecondary,
                          child: Icon(
                            PhosphorIcons.backspace(),
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Keypad(
                          _Key('enter'),
                          onTap: onEnter,
                          color: context.colors.primary,
                          child: Icon(
                            PhosphorIcons.arrowElbowDownLeft(PhosphorIconsStyle.thin),
                            size: IconSizes.lg,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///
class Keypad extends StatelessWidget {
  ///
  const Keypad(this._key, {this.color, this.child, this.onTap, super.key});
  final _Key _key;
  final Color? color;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(
            color: context.colors.onSecondary,
            width: .9,
          ),
        ),
        child: Center(
          child: child ??
              Text(
                _key.value,
                // style: context.textTheme.subtitle1,
              ),
        ),
      ),
    );
  }
}

///
class _Key {
  ///
  _Key(this.value, {this.addAmount = false});

  String value;
  bool addAmount;
}

///
abstract class KeyboardConfigs {
  ///
  static final List<_Key> quickKeys = [
    _Key('100', addAmount: true),
    _Key('250', addAmount: true),
    _Key('500', addAmount: true),
  ];

  ///
  static final List<List<_Key>> numberKeys = [
    [
      _Key('1'),
      _Key('2'),
      _Key('3'),
    ],
    [
      _Key('4'),
      _Key('5'),
      _Key('6'),
    ],
    [
      _Key('7'),
      _Key('8'),
      _Key('9'),
    ]
  ];
}
