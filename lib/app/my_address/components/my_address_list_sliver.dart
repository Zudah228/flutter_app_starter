import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_core/ui_parts/async/empty_message.dart';
import '../../../domain/my_address/my_address.dart';
import 'my_address_card.dart';

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
        final address = myAddressList[index];

        return MyAddressCard(address: address);
      },
    );
  }
}
