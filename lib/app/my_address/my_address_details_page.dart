import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_core/ui_parts/snack_bar.dart';
import '../../domain/my_address/my_address.dart';
import '../../util/extensions/string_extension.dart';

typedef MyAddressDetailsPageArguments = _PageArguments;
typedef _PageArguments = ({MyAddress address});

class MyAddressDetailsPage extends StatefulWidget {
  const MyAddressDetailsPage._(this.arguments);

  static const routeName = '/my_address_details';

  static Route<void> route(MyAddressDetailsPageArguments arguments) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: arguments),
      builder: (_) => MyAddressDetailsPage._(arguments),
    );
  }

  final MyAddressDetailsPageArguments arguments;

  @override
  State<MyAddressDetailsPage> createState() => _MyAddressDetailsPageState();
}

class _MyAddressDetailsPageState extends State<MyAddressDetailsPage> {
  MyAddress get address => widget.arguments.address;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('住所詳細'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _ClipboardText(
                address.prefecture +
                    address.city +
                    address.address1 +
                    address.address2,
                caption: '長押しで全文をコピー',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.prefecture,
                      style: textTheme.headlineSmall,
                    ),
                    Text(address.city + address.address1 + address.address2),
                  ],
                ),
              ),

              // URL
              if (address.url?.nullIfEmpty case final url?) ...[
                const SizedBox(height: 16),
                _ClipboardText(url),
              ],

              // 説明
              if (address.description?.nullIfEmpty case final description?) ...[
                const SizedBox(height: 16),
                _ClipboardText(description),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ClipboardText extends StatelessWidget {
  const _ClipboardText(this.text, {this.caption = '長押しでコピー', this.child});

  final String text;
  final Widget? child;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final colorScheme = themeData.colorScheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onLongPress: () async {
          await Clipboard.setData(ClipboardData(text: text));

          showSnackBar(message: 'コピーしました');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child ?? Text(text),
            const SizedBox(height: 4),
            Text(
              caption,
              style: textTheme.bodySmall!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
