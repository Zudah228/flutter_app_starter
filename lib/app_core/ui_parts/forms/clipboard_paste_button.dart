import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardPasteButton extends StatelessWidget {
  const ClipboardPasteButton({super.key, required this.onPressed});

  final ValueChanged<String> onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final data = await Clipboard.getData('text/plain');
        final text = data?.text;

        if (text == null) {
          return;
        }
        onPressed(text);
      },
      icon: const Icon(Icons.paste),
    );
  }
}
