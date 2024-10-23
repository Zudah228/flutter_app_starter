import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final colorScheme = themeData.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Center(
        child: Text(
          message ?? 'コンテンツがありません',
          style: textTheme.bodyLarge!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
