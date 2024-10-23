import 'package:flutter/material.dart';

class UnfocusedGestureDetecter extends StatelessWidget {
  const UnfocusedGestureDetecter({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
