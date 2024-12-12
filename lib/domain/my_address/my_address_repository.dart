import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/drift/drift_database.dart';
import '../../service/drift/drift_service.dart';
import 'my_address.dart';

part 'my_address_repository.g.dart';

@riverpod
MyAddressRepository myAddressRepository(Ref ref) {
  return MyAddressRepository(ref);
}

class MyAddressRepository {
  const MyAddressRepository(this._ref);
  final Ref _ref;

  AppDriftDatabase get _db => _ref.read(driftServiceProvider).db;
  $MyAddressesTable get _table => _db.myAddresses;

  Future<int> insert({
    required String postCode,
    required String prefecture,
    required String city,
    required String address1,
    required String address2,
    required String? url,
    required String? description,
    required bool disabled,
  }) async {
    final insertStatement = _table.insert();

    final companion = MyAddressesCompanion.insert(
      postCode: postCode,
      prefecture: prefecture,
      city: city,
      address1: address1,
      address2: address2,
      updatedAt: DateTime.now(),
      description: Value(description),
      disabled: disabled,
      url: Value(url),
    );

    return insertStatement.insert(companion);
  }

  Future<void> update(
    int id, {
    required String postCode,
    required String prefecture,
    required String city,
    required String address1,
    required String address2,
    required String? url,
    required String? description,
    required bool disabled,
  }) async {
    final deleteStatement = _table.update()..where((tbl) => tbl.id.equals(id));

    await deleteStatement.write(MyAddressesCompanion(
      postCode: Value(postCode),
      prefecture: Value(prefecture),
      city: Value(city),
      address1: Value(address1),
      address2: Value(address2),
      updatedAt: Value(DateTime.now()),
      description: Value(description),
      disabled: Value(disabled),
      url: Value(url),
    ));
  }

  Future<void> delete(int id) async {
    final deleteStatement = _table.delete()..where((tbl) => tbl.id.equals(id));

    await deleteStatement.go();
  }

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
