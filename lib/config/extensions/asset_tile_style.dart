part of '../app_theme.dart';

// ignore_for_file: public_member_api_docs
@immutable
class AssetTileStyle extends ThemeExtension<AssetTileStyle> {
  const AssetTileStyle({
    required this.backgroundColor,
    required this.borderRadius,
  });

  final Color backgroundColor;
  final double borderRadius;

  @override
  ThemeExtension<AssetTileStyle> copyWith({
    Color? backgroundColor,
    double? borderRadius,
  }) {
    return AssetTileStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<AssetTileStyle> lerp(ThemeExtension<AssetTileStyle>? other, double t) {
    if (other is! AssetTileStyle) {
      return this;
    }

    return AssetTileStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t) ?? borderRadius,
    );
  }
}

extension AssetTileStyleX on BuildContext {
  AssetTileStyle get assetTileStyle => Theme.of(this).extension<AssetTileStyle>()!;
}
