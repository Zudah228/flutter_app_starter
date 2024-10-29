import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.refresh,
  });

  final VoidCallback? refresh;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 80),
            const SizedBox(height: 28.67),
            Text(
              '接続に失敗しました',
              style: themeData.textTheme.titleLarge!.copyWith(
                color: themeData.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'インターネットの接続状況を確認して、もう一度やりなおしてください。',
              style: themeData.textTheme.bodyMedium!.copyWith(
                color: themeData.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (refresh != null)
              FilledButton.icon(
                icon: const Icon(Icons.refresh_outlined),
                onPressed: refresh,
                label: const Text(
                  'やりなおす',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
