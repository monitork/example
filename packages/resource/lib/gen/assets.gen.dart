/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/development.env
  String get development => 'assets/env/development.env';

  /// File path: assets/env/production.env
  String get production => 'assets/env/production.env';

  /// File path: assets/env/stagging.env
  String get stagging => 'assets/env/stagging.env';

  /// List of all assets
  List<String> get values => [development, production, stagging];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/.gitkeep
  String get gitkeep => 'assets/fonts/.gitkeep';

  /// List of all assets
  List<String> get values => [gitkeep];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [background];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bag-outline-svgrepo-com.svg
  SvgGenImage get bagOutlineSvgrepoCom =>
      const SvgGenImage('assets/svg/bag-outline-svgrepo-com.svg');

  /// File path: assets/svg/bell-notification-svgrepo-com.svg
  SvgGenImage get bellNotificationSvgrepoCom =>
      const SvgGenImage('assets/svg/bell-notification-svgrepo-com.svg');

  /// File path: assets/svg/coffee-cup-coffee-svgrepo-com.svg
  SvgGenImage get coffeeCupCoffeeSvgrepoCom =>
      const SvgGenImage('assets/svg/coffee-cup-coffee-svgrepo-com.svg');

  /// File path: assets/svg/coffee-svgrepo-com.svg
  SvgGenImage get coffeeSvgrepoCom =>
      const SvgGenImage('assets/svg/coffee-svgrepo-com.svg');

  /// File path: assets/svg/favourite-svgrepo-com.svg
  SvgGenImage get favouriteSvgrepoCom =>
      const SvgGenImage('assets/svg/favourite-svgrepo-com.svg');

  /// File path: assets/svg/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/svg/filter.svg');

  /// File path: assets/svg/home-svgrepo-com.svg
  SvgGenImage get homeSvgrepoCom =>
      const SvgGenImage('assets/svg/home-svgrepo-com.svg');

  /// File path: assets/svg/profile-svgrepo-com.svg
  SvgGenImage get profileSvgrepoCom =>
      const SvgGenImage('assets/svg/profile-svgrepo-com.svg');

  /// File path: assets/svg/search-svgrepo-com.svg
  SvgGenImage get searchSvgrepoCom =>
      const SvgGenImage('assets/svg/search-svgrepo-com.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        bagOutlineSvgrepoCom,
        bellNotificationSvgrepoCom,
        coffeeCupCoffeeSvgrepoCom,
        coffeeSvgrepoCom,
        favouriteSvgrepoCom,
        filter,
        homeSvgrepoCom,
        profileSvgrepoCom,
        searchSvgrepoCom
      ];
}

class AppAssets {
  AppAssets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
