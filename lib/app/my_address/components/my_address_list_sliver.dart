import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_core/async/empty_message.dart';
import '../../../domain/my_address/my_address.dart';

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

        return _Card(address: address);
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.address});

  final MyAddress address;

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(),
        ),
      ),
    );
  }
}
