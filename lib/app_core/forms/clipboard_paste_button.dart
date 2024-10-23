import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardPasteButton extends StatelessWidget {
  const ClipboardPasteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final state = context.findAncestorStateOfType<FormFieldState<String>>();

        if (state == null) {
          return;
        }

        final data = await Clipboard.getData('text/plain');
        final text = data?.text;

        if (text == null) {
          return;
        }
        state.didChange(text);
      },
      icon: const Icon(Icons.paste),
    );
  }
}
