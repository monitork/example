import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_money/config/app_router.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:go_money/features/common/presentation/widgets/platform/platform_alert_dialog.dart';
import 'package:resource/resource.dart';

abstract class Dialogs {
  static const _defaultTitlePadding = EdgeInsets.symmetric(
    vertical: Insets.dialogPaddingV20,
    horizontal: Insets.dialogPaddingH20,
  );

  static const _defaultContentPadding = EdgeInsets.symmetric(
    vertical: Insets.dialogPaddingV20,
    horizontal: Insets.dialogPaddingH20,
  );

  static const _defaultMaterialActionPadding = EdgeInsets.symmetric(
    vertical: Insets.dialogPaddingV20,
    horizontal: Insets.dialogPaddingH20,
  );

  static const _defaultMaterialInsetPadding = EdgeInsets.symmetric(
    horizontal: Insets.marginH20,
  );

  static final _defaultMaterialShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Insets.dialogR20),
  );

  static Widget _titleText(BuildContext context, String text) => Text(
        text,
        //Explicitly using style to be applied for CupertinoAlertDialog.
        style: Theme.of(context).dialogTheme.titleTextStyle,
        textAlign: TextAlign.center,
      );

  static Widget _contentText(BuildContext context, String text) => Text(
        text,
        //Explicitly using style to be applied for CupertinoAlertDialog.
        style: Theme.of(context).dialogTheme.contentTextStyle,
        textAlign: TextAlign.center,
      );

  static Future<T?> showLoadingDialog<T extends Object?>(BuildContext context) async {
    return showPlatformAlertDialog(
      context: context,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Insets.dialogPaddingV28,
        horizontal: Insets.dialogPaddingH20,
      ),
      content: (context) => const Column(
        children: <Widget>[
          SizedBox(
            height: Insets.marginV12,
          ),
          Text(
            'Loading',
          ),
        ],
      ),
      materialDialogData: MaterialDialogData(
        maxWidth: 240,
        insetPadding: _defaultMaterialInsetPadding,
        shape: _defaultMaterialShape,
      ),
    );
  }

  static Future<T?> showCustomDialog<T extends Object?>(
    BuildContext context, {
    Widget? title,
    Widget Function(BuildContext context)? content,
    List<Widget>? Function(BuildContext context)? materialActions,
    List<CupertinoDialogAction> Function(BuildContext context)? cupertinoActions,
  }) async {
    return showPlatformAlertDialog(
      context: context,
      titlePadding: _defaultTitlePadding,
      title: title,
      contentPadding: _defaultContentPadding,
      content: content,
      materialDialogData: MaterialDialogData(
        shape: _defaultMaterialShape,
        actions: (context) => materialActions?.call(context),
        actionsPadding: _defaultMaterialActionPadding,
        insetPadding: _defaultMaterialInsetPadding,
      ),
      cupertinoDialogData: CupertinoDialogData(
        actions: (context) => cupertinoActions?.call(context) ?? [],
      ),
    );
  }

  static Future<T?> showErrorDialog<T extends Object?>(
    BuildContext context, {
    required String message,
  }) async {
    return showCustomDialog(
      context,
      title: _titleText(context, context.tr.ops_err),
      content: (_) => Column(
        children: <Widget>[
          // Image.asset(
          //   MyAssets.ASSETS_ICONS_DIALOG_WIDGET_ICONS_ERROR_PNG,
          //   color: const Color(0xffcca76a),
          //   height: 72,
          //   width: 72,
          //   fit: BoxFit.contain,
          // ),
          const SizedBox(
            height: Insets.marginV8,
          ),
          _contentText(context, message),
        ],
      ),
      materialActions: (ctx) => [
        // CustomElevatedButton(
        //   enableGradient: true,
        //   onPressed: () => NavigationService.popDialog(ctx),
        //   child: Text(
        //     tr(context).oK,
        //     style: TextStyles.coloredElevatedButton(context),
        //   ),
        // ),
      ],
      cupertinoActions: (ctx) => [
        CupertinoDialogAction(
          onPressed: () => NavigationService.popDialog(ctx),
          child: const Text(
            'OK',
          ),
        ),
      ],
    );
  }

  static Future<T?> showConfirmDialog<T extends Object?>(
    BuildContext context, {
    required String title,
    required String confirmTitle,
    required void Function(BuildContext) confirmCallback,
    String? description,
    Widget Function(BuildContext context)? content,
  }) {
    assert(
      description != null || content != null,
      'One of description or content must be specified',
    );
    assert(
      description == null || content == null,
      'Only one of description or content may be specified',
    );

    return showCustomDialog(
      context,
      title: _titleText(context, title),
      content: (ctx) => content?.call(ctx) ?? _contentText(context, description!),
      materialActions: (ctx) => [
        TextButton(
          onPressed: () => NavigationService.popDialog(ctx),
          child: Text(
            context.tr.cancel,
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () => confirmCallback(ctx),
          child: Text(
            confirmTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
      cupertinoActions: (ctx) => [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => NavigationService.popDialog(ctx),
          child: Text(context.tr.cancel),
        ),
        CupertinoDialogAction(
          onPressed: () => confirmCallback(ctx),
          child: Text(confirmTitle),
        ),
      ],
    );
  }
}
