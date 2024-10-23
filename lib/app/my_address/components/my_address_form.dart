import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_core/forms/clipboard_paste_button.dart';
import '../../../app_core/forms/form_headline.dart';
import '../../../domain/my_address/my_address.dart';
import '../../../domain/post_code_search/post_code_search_repository.dart';
import '../../../domain/post_code_search/post_code_search_result.dart';

class MyAddressForm extends StatefulWidget {
  const MyAddressForm({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  final MyAddress? initialValue;
  final ValueChanged<MyAddress?> onChanged;

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
    _prefectureController.text = result.address1;
    _cityController.text = result.address2;
    _address1Controller.text = result.address3;
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
    MyAddress? value;
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _postCodeController,
                    decoration: const InputDecoration(
                      label: Text(
                        '郵便番号',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _PostCodeSearchButton(
                  postCodeController: _postCodeController,
                  onFetched: _onSearch,
                )
              ],
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
              decoration: const InputDecoration(
                label: Text(
                  'URL',
                ),
                suffixIcon: ClipboardPasteButton(),
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
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.postCodeController,
      builder: (context, _) {
        final isValid = _validate();

        return IconButton.filled(
          onPressed: isValid ? _fetch : null,
          style: IconButton.styleFrom(
            minimumSize: const Size(
              kMinInteractiveDimension + 8,
              kMinInteractiveDimension,
            ),
          ),
          icon: const Icon(Icons.search),
        );
      },
    );
  }
}
