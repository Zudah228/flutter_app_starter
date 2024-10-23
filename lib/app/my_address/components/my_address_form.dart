import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_core/forms/clipboard_paste_button.dart';
import '../../../app_core/forms/form_headline.dart';
import '../../../app_core/snack_bar.dart';
import '../../../domain/my_address/my_address.dart';
import '../../../domain/post_code_search/post_code_search_repository.dart';
import '../../../domain/post_code_search/post_code_search_result.dart';

@immutable
class MyAddressFormValue {
  const MyAddressFormValue({
    required this.postCode,
    required this.prefecture,
    required this.city,
    required this.address1,
    required this.address2,
    required this.url,
    required this.description,
    required this.disabled,
  });

  final String postCode;
  final String prefecture;
  final String city;
  final String address1;
  final String address2;
  final String? url;
  final String? description;
  final bool disabled;

  @override
  String toString() {
    return 'MyAddressFormValue($postCode)';
  }

  MyAddress toEntity(int id, {required DateTime updatedAt}) {
    return MyAddress.fromDb(
      id: id,
      postCode: postCode,
      prefecture: prefecture,
      city: city,
      address1: address1,
      address2: address2,
      updatedAt: updatedAt,
      description: description,
      disabled: disabled,
      url: url,
    );
  }
}

class MyAddressForm extends StatefulWidget {
  const MyAddressForm({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  final MyAddress? initialValue;
  final ValueChanged<MyAddressFormValue?> onChanged;

  @override
  State<StatefulWidget> createState() => _MyAddressFormState();
}

class _MyAddressFormState extends State<MyAddressForm> {
  late final TextEditingController _prefectureController;
  late final TextEditingController _postCodeController;
  late final TextEditingController _cityController;
  late final TextEditingController _address1Controller;
  late final TextEditingController _address2Controller;
  late final TextEditingController _descriptionController;
  late final TextEditingController _urlController;

  void _onSearch(PostCodeSearchResult result) {
    _prefectureController.text = result.prefecture;
    _cityController.text = result.city;
    _address1Controller.text = result.address;
  }

  void _applyDefault() {
    _prefectureController = TextEditingController(
      text: widget.initialValue?.prefecture,
    );
    _postCodeController = TextEditingController(
      text: widget.initialValue?.postCode,
    );
    _cityController = TextEditingController(
      text: widget.initialValue?.city,
    );
    _address1Controller = TextEditingController(
      text: widget.initialValue?.address1,
    );
    _address2Controller = TextEditingController(
      text: widget.initialValue?.address2,
    );
    _descriptionController = TextEditingController(
      text: widget.initialValue?.description,
    );
    _urlController = TextEditingController(
      text: widget.initialValue?.url,
    );
  }

  void _onChanged() {
    final value = MyAddressFormValue(
      postCode: _postCodeController.text,
      prefecture: _prefectureController.text,
      city: _cityController.text,
      address1: _address1Controller.text,
      address2: _address2Controller.text,
      url: _urlController.text,
      description: _descriptionController.text,
      disabled: false,
    );

    widget.onChanged(value);
  }

  @override
  void initState() {
    _applyDefault();
    super.initState();
  }

  @override
  void dispose() {
    final disposers = [
      _postCodeController.dispose,
      _prefectureController.dispose
    ];

    for (final dispose in disposers) {
      dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Form(
        onChanged: _onChanged,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeadline('住所データ'),

            // 郵便番号
            TextFormField(
              controller: _postCodeController,
              decoration: InputDecoration(
                  label: const Text(
                    '郵便番号',
                  ),
                  suffixIcon: _PostCodeSearchButton(
                    postCodeController: _postCodeController,
                    onFetched: _onSearch,
                  )),
              inputFormatters: [FilteringTextInputFormatter.deny('-')],
            ),
            const SizedBox(height: 16),

            // 都道府県
            TextFormField(
              controller: _prefectureController,
              decoration: const InputDecoration(
                label: Text(
                  '都道府県',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 市町村
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(
                label: Text(
                  '市町村',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 住所１
            TextFormField(
              controller: _address1Controller,
              decoration: const InputDecoration(
                label: Text(
                  '住所１',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 住所２
            TextFormField(
              controller: _address2Controller,
              decoration: const InputDecoration(
                label: Text(
                  '住所２',
                ),
              ),
            ),
            const SizedBox(height: 32),

            const FormHeadline('その他'),
            // 説明
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                label: Text(
                  '説明',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // URL
            TextFormField(
              controller: _urlController,
              decoration: InputDecoration(
                label: const Text(
                  'URL',
                ),
                suffixIcon: ClipboardPasteButton(
                  onPressed: (value) {
                    _urlController.text = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostCodeSearchButton extends ConsumerStatefulWidget {
  const _PostCodeSearchButton({
    required this.onFetched,
    required this.postCodeController,
  });

  final TextEditingController postCodeController;
  final ValueChanged<PostCodeSearchResult> onFetched;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostCodeSearchButtonState();
}

class _PostCodeSearchButtonState extends ConsumerState<_PostCodeSearchButton> {
  bool _validate() {
    return RegExp(r'[0-9]{3}[\-]?[0-9]{4}')
        .hasMatch(widget.postCodeController.text);
  }

  Future<void> _fetch() async {
    try {
      final code = widget.postCodeController.text;

      final result =
          await ref.read(postCodeSearchRepositoryProvider).search(code);

      widget.onFetched(result);
    } catch (_) {
      showErrorSnackBar(message: '住所が取得できませんでした');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.postCodeController,
      builder: (context, _) {
        final isValid = _validate();

        return IconButton(
          onPressed: isValid ? _fetch : null,
          style: IconButton.styleFrom(
            visualDensity: const VisualDensity(vertical: 2),
            minimumSize: const Size(
              kMinInteractiveDimension + 8,
              kMinInteractiveDimension,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.search),
        );
      },
    );
  }
}
