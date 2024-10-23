import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/drift/drift_database.dart';
import '../../infrastructure/drift/drift_infrastructure.dart';
import 'my_address.dart';

part 'my_address_repository.g.dart';

@riverpod
MyAddressRepository myAddressRepository(Ref ref) {
  return MyAddressRepository(ref);
}

class MyAddressRepository {
  const MyAddressRepository(this._ref);
  final Ref _ref;

  AppDriftDatabase get _db => _ref.read(driftInfrastructureProvider).db;
  $MyAddressesTable get _table => _db.myAddresses;

  Stream<List<MyAddress>> watch() {
    final select = _table.select()
      ..orderBy(
        [
          (u) {
            return OrderingTerm.desc(u.updatedAt);
          }
        ],
      );

    return select.watch();
  }
}
