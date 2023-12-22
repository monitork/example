part of '../_config.dart';

// ignore_for_file: public_member_api_docs

@immutable
class TransactionTileStyle extends ThemeExtension<TransactionTileStyle> {
  const TransactionTileStyle({
    required this.backgroundColor,
    required this.borderRadius,
  });

  final Color backgroundColor;
  final double borderRadius;

  @override
  ThemeExtension<TransactionTileStyle> copyWith({
    Color? backgroundColor,
    double? borderRadius,
  }) {
    return TransactionTileStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<TransactionTileStyle> lerp(ThemeExtension<TransactionTileStyle>? other, double t) {
    if (other is! TransactionTileStyle) {
      return this;
    }

    return TransactionTileStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t) ?? borderRadius,
    );
  }
}

extension TransactionTileStyleX on BuildContext {
  TransactionTileStyle get transactionTileStyle => Theme.of(this).extension<TransactionTileStyle>()!;
}
