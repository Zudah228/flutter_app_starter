import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_core/dialogs/common_confirm_dialog.dart';
import '../../../app_core/snack_bar.dart';
import '../../../domain/my_address/my_address.dart';
import '../../../domain/my_address/my_address_repository.dart';
import '../../../util/extensions/string_extension.dart';
import '../my_address_edit_page.dart';

class MyAddressCard extends ConsumerWidget {
  const MyAddressCard({super.key, required this.address});

  final MyAddress address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;

    Future<void> onTap() async {
      Navigator.of(context).push(
        MyAddressEditPage.route((initialValue: address)),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Title(address: address),
              const SizedBox(height: 4),

              Text(address.city + address.address1 + address.address2),

              // 説明
              if (address.description?.nullIfEmpty case final description?) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.notes,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(description),
                  ],
                )
              ],

              // URL
              if (address.url?.nullIfEmpty case final url?) ...[
                const SizedBox(height: 12),
                Material(
                  type: MaterialType.transparency,
                  textStyle: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: url));

                      showSnackBar(message: 'コピーしました');
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.share,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text('位置情報をコピー')
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title({required this.address});

  final MyAddress address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    Future<void> delete() async {
      try {
        final confirmed = await showConfirmDialog(
          context,
          title: const Text('削除しますか？'),
          okLabel: '削除する',
        );

        if (confirmed != ConfirmResult.ok) {
          return;
        }

        await ref.read(myAddressRepositoryProvider).delete(address.id);
      } catch (_) {}
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '〒 '
                '${address.postCode}',
                style: textTheme.bodySmall,
              ),
              Text(
                address.prefecture,
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: delete,
                child: const Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 4),
                    Text('削除')
                  ],
                ),
              )
            ];
          },
        ),
      ],
    );
  }
}
