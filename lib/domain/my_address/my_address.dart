import 'package:drift/drift.dart';
import 'package:meta/meta.dart';

@UseRowClass(MyAddress, constructor: 'fromDb')
class MyAddresses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get postCode => text()();
  TextColumn get prefecture => text()();
  TextColumn get city => text()();
  TextColumn get address1 => text()();
  TextColumn get address2 => text()();
  TextColumn get url => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
}

@immutable
class MyAddress {
  const MyAddress.fromDb({
    required this.id,
    required this.postCode,
    required this.prefecture,
    required this.city,
    required this.address1,
    required this.address2,
    required this.updatedAt,
    this.url,
    this.description,
    this.disabled = false,
  });

  final int id;
  final String postCode;
  final String prefecture;
  final String city;
  final String address1;
  final String address2;
  final DateTime updatedAt;
  final String? url;
  final String? description;
  final bool disabled;
}
