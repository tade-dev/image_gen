/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/empty_icon.png
  AssetGenImage get emptyIcon =>
      const AssetGenImage('assets/icon/empty_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [emptyIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/albert.jpeg
  AssetGenImage get albert => const AssetGenImage('assets/images/albert.jpeg');

  /// File path: assets/images/catmilk.jpeg
  AssetGenImage get catmilk =>
      const AssetGenImage('assets/images/catmilk.jpeg');

  /// File path: assets/images/coffeeshop.jpeg
  AssetGenImage get coffeeshop =>
      const AssetGenImage('assets/images/coffeeshop.jpeg');

  /// File path: assets/images/lake.jpeg
  AssetGenImage get lake => const AssetGenImage('assets/images/lake.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [albert, catmilk, coffeeshop, lake];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bx_stop-circle.svg
  String get bxStopCircle => 'assets/svg/bx_stop-circle.svg';

  /// File path: assets/svg/mynaui_arrow-up-right-circle-solid.svg
  String get mynauiArrowUpRightCircleSolid =>
      'assets/svg/mynaui_arrow-up-right-circle-solid.svg';

  /// File path: assets/svg/profile_avatar.svg
  String get profileAvatar => 'assets/svg/profile_avatar.svg';

  /// List of all assets
  List<String> get values =>
      [bxStopCircle, mynauiArrowUpRightCircleSolid, profileAvatar];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
