import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_core/ui_parts/snack_bar.dart';
import '../../app_core/ui_parts/unfocused_gesture_detecter.dart';
import '../../domain/my_address/my_address_repository.dart';
import 'components/my_address_form.dart';

class MyAddressRegisterPage extends ConsumerStatefulWidget {
  const MyAddressRegisterPage._();

  static const routeName = '/my_address_register';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MyAddressRegisterPage._(),
    );
  }

  @override
  ConsumerState<MyAddressRegisterPage> createState() =>
      _MyAddressRegisterPageState();
}

class _MyAddressRegisterPageState extends ConsumerState<MyAddressRegisterPage> {
  MyAddressFormValue? _value;

  void _onChanged(MyAddressFormValue? value) {
    setState(() {
      _value = value;
    });
  }

  Future<void> _save() async {
    try {
      final value = _value;

      if (value == null) {
        return;
      }

      await ref.read(myAddressRepositoryProvider).insert(
            postCode: value.postCode,
            city: value.city,
            address1: value.address1,
            address2: value.address2,
            description: value.description,
            disabled: value.disabled,
            prefecture: value.prefecture,
            url: value.url,
          );

      showSnackBar(message: '住所を保存しました');

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showErrorSnackBar(message: '保存に失敗しました');
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusedGestureDetecter(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('住所登録'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _value == null ? null : _save,
          icon: const Icon(Icons.save),
          label: const Text('保存'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Column(
              children: [
                MyAddressForm(onChanged: _onChanged),
                const SizedBox(height: kMinInteractiveDimension + 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
