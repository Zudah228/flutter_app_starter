import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    required this.title,
    required this.content,
    this.primaryAction,
    this.cancelAction,
    this.spaceBetweenTitleAndContent,
  });

  final Widget title;
  final Widget? content;
  final double? spaceBetweenTitleAndContent;
  final CommonDialogAction? primaryAction;
  final CommonDialogAction? cancelAction;

  static Size get _actionMinimumSize => const Size(
        124,
        40,
      );
  static const _minDeviceSize = 375;

  Size _getActionMinimumSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth <= _minDeviceSize
        ? MediaQuery.of(context).size.width * 0.28
        : _actionMinimumSize.width;
    return Size(buttonWidth, _actionMinimumSize.height);
  }

  List<Widget> _getActions(BuildContext context) {
    final actionMinimumSize = _getActionMinimumSize(context);
    return [
      if (cancelAction case final action?)
        OutlinedButton(
          onPressed: action.onTap,
          style: OutlinedButton.styleFrom(
            minimumSize: actionMinimumSize,
          ),
          child: Text(action.label),
        ),
      if (primaryAction case final action?)
        FilledButton(
          onPressed: action.onTap,
          style: FilledButton.styleFrom(
            minimumSize: actionMinimumSize,
          ),
          child: Text(action.label),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final effectiveContentPadding = EdgeInsets.only(
      left: 24,
      top:
          spaceBetweenTitleAndContent ?? (themeData.useMaterial3 ? 16.0 : 20.0),
      right: 24,
      bottom: 24,
    );

    final actions = _getActions(context);
    final MainAxisAlignment actionsAlignment;
    if (actions.length >= 2) {
      actionsAlignment = MainAxisAlignment.spaceBetween;
    } else {
      actionsAlignment = MainAxisAlignment.center;
    }

    return AlertDialog(
      title: DefaultTextStyle.merge(
        textAlign: TextAlign.center,
        child: Center(child: title),
      ),
      contentPadding: effectiveContentPadding,
      content: content != null
          ? DefaultTextStyle.merge(
              textAlign: TextAlign.center,
              child: content!,
            )
          : null,
      actions: actions,
      actionsAlignment: actionsAlignment,
    );
  }
}

@immutable
class CommonDialogAction {
  const CommonDialogAction({required this.label, required this.onTap});

  final String label;

  /// Null を渡せば、ボタンが非活性になる
  final VoidCallback? onTap;
}
