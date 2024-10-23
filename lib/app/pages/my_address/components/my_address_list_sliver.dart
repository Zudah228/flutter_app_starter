import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infrastructure/drift/drift_database.dart';
import '../../../components/async/empty_message.dart';

class MyAddressListSliver extends ConsumerWidget {
  const MyAddressListSliver(this.myAddressList, {super.key});

  final List<MyAddress> myAddressList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (myAddressList.isEmpty) {
      return const SliverFillRemaining(
        child: EmptyMessage(),
      );
    }

    return SliverList.builder(
      itemCount: myAddressList.length,
      itemBuilder: (context, index) {
        return null;
      },
    );
  }
}
