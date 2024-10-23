import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_core/unfocused_gesture_detecter.dart';
import '../../domain/my_address/my_address.dart';
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
  MyAddress? _value;

  void _onChanged(MyAddress? value) {
    setState(() {
      _value = value;
    });
  }

  Future<void> _save() async {
    // TODO(tsuda): 住所の保存処理
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
