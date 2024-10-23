import 'package:flutter/material.dart';

class FormHeadline extends StatelessWidget {
  const FormHeadline(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: textTheme.titleLarge,
        textAlign: TextAlign.start,
      ),
    );
  }
}
