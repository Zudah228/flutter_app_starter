// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $MyAddressesTable extends MyAddresses
    with TableInfo<$MyAddressesTable, MyAddress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyAddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _prefectureMeta =
      const VerificationMeta('prefecture');
  @override
  late final GeneratedColumn<String> prefecture = GeneratedColumn<String>(
      'prefecture', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _address1Meta =
      const VerificationMeta('address1');
  @override
  late final GeneratedColumn<String> address1 = GeneratedColumn<String>(
      'address1', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _address2Meta =
      const VerificationMeta('address2');
  @override
  late final GeneratedColumn<String> address2 = GeneratedColumn<String>(
      'address2', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _googlemapUrlMeta =
      const VerificationMeta('googlemapUrl');
  @override
  late final GeneratedColumn<String> googlemapUrl = GeneratedColumn<String>(
      'googlemap_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, prefecture, city, address1, address2, googlemapUrl, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_addresses';
  @override
  VerificationContext validateIntegrity(Insertable<MyAddress> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('prefecture')) {
      context.handle(
          _prefectureMeta,
          prefecture.isAcceptableOrUnknown(
              data['prefecture']!, _prefectureMeta));
    } else if (isInserting) {
      context.missing(_prefectureMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('address1')) {
      context.handle(_address1Meta,
          address1.isAcceptableOrUnknown(data['address1']!, _address1Meta));
    } else if (isInserting) {
      context.missing(_address1Meta);
    }
    if (data.containsKey('address2')) {
      context.handle(_address2Meta,
          address2.isAcceptableOrUnknown(data['address2']!, _address2Meta));
    } else if (isInserting) {
      context.missing(_address2Meta);
    }
    if (data.containsKey('googlemap_url')) {
      context.handle(
          _googlemapUrlMeta,
          googlemapUrl.isAcceptableOrUnknown(
              data['googlemap_url']!, _googlemapUrlMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyAddress map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyAddress(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      prefecture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prefecture'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      address1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address1'])!,
      address2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address2'])!,
      googlemapUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}googlemap_url']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $MyAddressesTable createAlias(String alias) {
    return $MyAddressesTable(attachedDatabase, alias);
  }
}

class MyAddress extends DataClass implements Insertable<MyAddress> {
  final int id;
  final String prefecture;
  final String city;
  final String address1;
  final String address2;
  final String? googlemapUrl;
  final DateTime updatedAt;
  const MyAddress(
      {required this.id,
      required this.prefecture,
      required this.city,
      required this.address1,
      required this.address2,
      this.googlemapUrl,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['prefecture'] = Variable<String>(prefecture);
    map['city'] = Variable<String>(city);
    map['address1'] = Variable<String>(address1);
    map['address2'] = Variable<String>(address2);
    if (!nullToAbsent || googlemapUrl != null) {
      map['googlemap_url'] = Variable<String>(googlemapUrl);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MyAddressesCompanion toCompanion(bool nullToAbsent) {
    return MyAddressesCompanion(
      id: Value(id),
      prefecture: Value(prefecture),
      city: Value(city),
      address1: Value(address1),
      address2: Value(address2),
      googlemapUrl: googlemapUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(googlemapUrl),
      updatedAt: Value(updatedAt),
    );
  }

  factory MyAddress.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyAddress(
      id: serializer.fromJson<int>(json['id']),
      prefecture: serializer.fromJson<String>(json['prefecture']),
      city: serializer.fromJson<String>(json['city']),
      address1: serializer.fromJson<String>(json['address1']),
      address2: serializer.fromJson<String>(json['address2']),
      googlemapUrl: serializer.fromJson<String?>(json['googlemapUrl']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'prefecture': serializer.toJson<String>(prefecture),
      'city': serializer.toJson<String>(city),
      'address1': serializer.toJson<String>(address1),
      'address2': serializer.toJson<String>(address2),
      'googlemapUrl': serializer.toJson<String?>(googlemapUrl),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  MyAddress copyWith(
          {int? id,
          String? prefecture,
          String? city,
          String? address1,
          String? address2,
          Value<String?> googlemapUrl = const Value.absent(),
          DateTime? updatedAt}) =>
      MyAddress(
        id: id ?? this.id,
        prefecture: prefecture ?? this.prefecture,
        city: city ?? this.city,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        googlemapUrl:
            googlemapUrl.present ? googlemapUrl.value : this.googlemapUrl,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  MyAddress copyWithCompanion(MyAddressesCompanion data) {
    return MyAddress(
      id: data.id.present ? data.id.value : this.id,
      prefecture:
          data.prefecture.present ? data.prefecture.value : this.prefecture,
      city: data.city.present ? data.city.value : this.city,
      address1: data.address1.present ? data.address1.value : this.address1,
      address2: data.address2.present ? data.address2.value : this.address2,
      googlemapUrl: data.googlemapUrl.present
          ? data.googlemapUrl.value
          : this.googlemapUrl,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyAddress(')
          ..write('id: $id, ')
          ..write('prefecture: $prefecture, ')
          ..write('city: $city, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('googlemapUrl: $googlemapUrl, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, prefecture, city, address1, address2, googlemapUrl, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyAddress &&
          other.id == this.id &&
          other.prefecture == this.prefecture &&
          other.city == this.city &&
          other.address1 == this.address1 &&
          other.address2 == this.address2 &&
          other.googlemapUrl == this.googlemapUrl &&
          other.updatedAt == this.updatedAt);
}

class MyAddressesCompanion extends UpdateCompanion<MyAddress> {
  final Value<int> id;
  final Value<String> prefecture;
  final Value<String> city;
  final Value<String> address1;
  final Value<String> address2;
  final Value<String?> googlemapUrl;
  final Value<DateTime> updatedAt;
  const MyAddressesCompanion({
    this.id = const Value.absent(),
    this.prefecture = const Value.absent(),
    this.city = const Value.absent(),
    this.address1 = const Value.absent(),
    this.address2 = const Value.absent(),
    this.googlemapUrl = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MyAddressesCompanion.insert({
    this.id = const Value.absent(),
    required String prefecture,
    required String city,
    required String address1,
    required String address2,
    this.googlemapUrl = const Value.absent(),
    required DateTime updatedAt,
  })  : prefecture = Value(prefecture),
        city = Value(city),
        address1 = Value(address1),
        address2 = Value(address2),
        updatedAt = Value(updatedAt);
  static Insertable<MyAddress> custom({
    Expression<int>? id,
    Expression<String>? prefecture,
    Expression<String>? city,
    Expression<String>? address1,
    Expression<String>? address2,
    Expression<String>? googlemapUrl,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (prefecture != null) 'prefecture': prefecture,
      if (city != null) 'city': city,
      if (address1 != null) 'address1': address1,
      if (address2 != null) 'address2': address2,
      if (googlemapUrl != null) 'googlemap_url': googlemapUrl,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MyAddressesCompanion copyWith(
      {Value<int>? id,
      Value<String>? prefecture,
      Value<String>? city,
      Value<String>? address1,
      Value<String>? address2,
      Value<String?>? googlemapUrl,
      Value<DateTime>? updatedAt}) {
    return MyAddressesCompanion(
      id: id ?? this.id,
      prefecture: prefecture ?? this.prefecture,
      city: city ?? this.city,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      googlemapUrl: googlemapUrl ?? this.googlemapUrl,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (prefecture.present) {
      map['prefecture'] = Variable<String>(prefecture.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (address1.present) {
      map['address1'] = Variable<String>(address1.value);
    }
    if (address2.present) {
      map['address2'] = Variable<String>(address2.value);
    }
    if (googlemapUrl.present) {
      map['googlemap_url'] = Variable<String>(googlemapUrl.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyAddressesCompanion(')
          ..write('id: $id, ')
          ..write('prefecture: $prefecture, ')
          ..write('city: $city, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('googlemapUrl: $googlemapUrl, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDriftDatabase extends GeneratedDatabase {
  _$AppDriftDatabase(QueryExecutor e) : super(e);
  $AppDriftDatabaseManager get managers => $AppDriftDatabaseManager(this);
  late final $MyAddressesTable myAddresses = $MyAddressesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myAddresses];
}

typedef $$MyAddressesTableCreateCompanionBuilder = MyAddressesCompanion
    Function({
  Value<int> id,
  required String prefecture,
  required String city,
  required String address1,
  required String address2,
  Value<String?> googlemapUrl,
  required DateTime updatedAt,
});
typedef $$MyAddressesTableUpdateCompanionBuilder = MyAddressesCompanion
    Function({
  Value<int> id,
  Value<String> prefecture,
  Value<String> city,
  Value<String> address1,
  Value<String> address2,
  Value<String?> googlemapUrl,
  Value<DateTime> updatedAt,
});

class $$MyAddressesTableFilterComposer
    extends Composer<_$AppDriftDatabase, $MyAddressesTable> {
  $$MyAddressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prefecture => $composableBuilder(
      column: $table.prefecture, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address1 => $composableBuilder(
      column: $table.address1, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address2 => $composableBuilder(
      column: $table.address2, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get googlemapUrl => $composableBuilder(
      column: $table.googlemapUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$MyAddressesTableOrderingComposer
    extends Composer<_$AppDriftDatabase, $MyAddressesTable> {
  $$MyAddressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prefecture => $composableBuilder(
      column: $table.prefecture, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address1 => $composableBuilder(
      column: $table.address1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address2 => $composableBuilder(
      column: $table.address2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get googlemapUrl => $composableBuilder(
      column: $table.googlemapUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$MyAddressesTableAnnotationComposer
    extends Composer<_$AppDriftDatabase, $MyAddressesTable> {
  $$MyAddressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get prefecture => $composableBuilder(
      column: $table.prefecture, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get address1 =>
      $composableBuilder(column: $table.address1, builder: (column) => column);

  GeneratedColumn<String> get address2 =>
      $composableBuilder(column: $table.address2, builder: (column) => column);

  GeneratedColumn<String> get googlemapUrl => $composableBuilder(
      column: $table.googlemapUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MyAddressesTableTableManager extends RootTableManager<
    _$AppDriftDatabase,
    $MyAddressesTable,
    MyAddress,
    $$MyAddressesTableFilterComposer,
    $$MyAddressesTableOrderingComposer,
    $$MyAddressesTableAnnotationComposer,
    $$MyAddressesTableCreateCompanionBuilder,
    $$MyAddressesTableUpdateCompanionBuilder,
    (
      MyAddress,
      BaseReferences<_$AppDriftDatabase, $MyAddressesTable, MyAddress>
    ),
    MyAddress,
    PrefetchHooks Function()> {
  $$MyAddressesTableTableManager(_$AppDriftDatabase db, $MyAddressesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MyAddressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MyAddressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MyAddressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> prefecture = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> address1 = const Value.absent(),
            Value<String> address2 = const Value.absent(),
            Value<String?> googlemapUrl = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              MyAddressesCompanion(
            id: id,
            prefecture: prefecture,
            city: city,
            address1: address1,
            address2: address2,
            googlemapUrl: googlemapUrl,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String prefecture,
            required String city,
            required String address1,
            required String address2,
            Value<String?> googlemapUrl = const Value.absent(),
            required DateTime updatedAt,
          }) =>
              MyAddressesCompanion.insert(
            id: id,
            prefecture: prefecture,
            city: city,
            address1: address1,
            address2: address2,
            googlemapUrl: googlemapUrl,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MyAddressesTableProcessedTableManager = ProcessedTableManager<
    _$AppDriftDatabase,
    $MyAddressesTable,
    MyAddress,
    $$MyAddressesTableFilterComposer,
    $$MyAddressesTableOrderingComposer,
    $$MyAddressesTableAnnotationComposer,
    $$MyAddressesTableCreateCompanionBuilder,
    $$MyAddressesTableUpdateCompanionBuilder,
    (
      MyAddress,
      BaseReferences<_$AppDriftDatabase, $MyAddressesTable, MyAddress>
    ),
    MyAddress,
    PrefetchHooks Function()>;

class $AppDriftDatabaseManager {
  final _$AppDriftDatabase _db;
  $AppDriftDatabaseManager(this._db);
  $$MyAddressesTableTableManager get myAddresses =>
      $$MyAddressesTableTableManager(_db, _db.myAddresses);
}
