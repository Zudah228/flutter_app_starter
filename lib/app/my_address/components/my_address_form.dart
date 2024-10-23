import 'package:flutter/material.dart';

import '../../../infrastructure/drift/drift_database.dart';

class MyAddressForm extends StatefulWidget {
  const MyAddressForm({super.key, this.initialValue, required this.onChanged});

  final MyAddress? initialValue;
  final ValueChanged<MyAddress> onChanged;

  @override
  State<StatefulWidget> createState() => _MyAddressFormState();
}

class _MyAddressFormState extends State<MyAddressForm> {
  @override
  Widget build(BuildContext context) {
    return const Form(
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
