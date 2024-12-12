import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repository/my_address/models/my_address.dart';
import '../../../repository/my_address/my_address_repository.dart';

part 'my_address_list.g.dart';

@riverpod
Stream<List<MyAddress>> myAddressList(Ref ref) {
  return ref.watch(myAddressRepositoryProvider).watch();
}
