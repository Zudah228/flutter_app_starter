import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_core/ui_parts/snack_bar.dart';
import '../../repository/my_address/models/my_address.dart';
import '../../repository/my_address/my_address_repository.dart';
import 'components/my_address_form.dart';

typedef MyAddressEditPageArguments = _PageArguments;
typedef _PageArguments = ({MyAddress initialValue});

class MyAddressEditPage extends ConsumerStatefulWidget {
  const MyAddressEditPage._(this.arguments);

  static const routeName = '/my_address_edit_page';

  static Route<void> route(MyAddressEditPageArguments arguments) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: arguments),
      builder: (_) => MyAddressEditPage._(arguments),
    );
  }

  final MyAddressEditPageArguments arguments;

  @override
  ConsumerState<MyAddressEditPage> createState() => _MyAddressEditPageState();
}

class _MyAddressEditPageState extends ConsumerState<MyAddressEditPage> {
  int get id => widget.arguments.initialValue.id;

  MyAddress? _value;

  void onChanged(MyAddressFormValue? value) {
    setState(() {
      if (value == null) {
        _value = null;
      } else {
        _value = value.toEntity(
          id,
          updatedAt: widget.arguments.initialValue.updatedAt,
        );
      }
    });
  }

  Future<void> _save() async {
    try {
      final value = _value;

      if (value == null) {
        return;
      }

      await ref.read(myAddressRepositoryProvider).update(
            id,
            postCode: value.postCode,
            prefecture: value.prefecture,
            city: value.city,
            address1: value.address1,
            address2: value.address2,
            url: value.url,
            description: value.description,
            disabled: value.disabled,
          );
      showSnackBar(message: '更新しました');

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showErrorSnackBar(message: '保存に失敗しました');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('住所編集'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _value == null ? null : _save,
        icon: const Icon(Icons.save),
        label: const Text('保存'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            MyAddressForm(
              initialValue: widget.arguments.initialValue,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
