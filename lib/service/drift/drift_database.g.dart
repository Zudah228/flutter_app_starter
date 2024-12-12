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
  static const VerificationMeta _postCodeMeta =
      const VerificationMeta('postCode');
  @override
  late final GeneratedColumn<String> postCode = GeneratedColumn<String>(
      'post_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _disabledMeta =
      const VerificationMeta('disabled');
  @override
  late final GeneratedColumn<bool> disabled = GeneratedColumn<bool>(
      'disabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("disabled" IN (0, 1))'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        postCode,
        prefecture,
        city,
        address1,
        address2,
        url,
        updatedAt,
        disabled,
        description
      ];
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
    if (data.containsKey('post_code')) {
      context.handle(_postCodeMeta,
          postCode.isAcceptableOrUnknown(data['post_code']!, _postCodeMeta));
    } else if (isInserting) {
      context.missing(_postCodeMeta);
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
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('disabled')) {
      context.handle(_disabledMeta,
          disabled.isAcceptableOrUnknown(data['disabled']!, _disabledMeta));
    } else if (isInserting) {
      context.missing(_disabledMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyAddress map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyAddress.fromDb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      postCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}post_code'])!,
      prefecture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prefecture'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      address1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address1'])!,
      address2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address2'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      disabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}disabled'])!,
    );
  }

  @override
  $MyAddressesTable createAlias(String alias) {
    return $MyAddressesTable(attachedDatabase, alias);
  }
}

class MyAddressesCompanion extends UpdateCompanion<MyAddress> {
  final Value<int> id;
  final Value<String> postCode;
  final Value<String> prefecture;
  final Value<String> city;
  final Value<String> address1;
  final Value<String> address2;
  final Value<String?> url;
  final Value<DateTime> updatedAt;
  final Value<bool> disabled;
  final Value<String?> description;
  const MyAddressesCompanion({
    this.id = const Value.absent(),
    this.postCode = const Value.absent(),
    this.prefecture = const Value.absent(),
    this.city = const Value.absent(),
    this.address1 = const Value.absent(),
    this.address2 = const Value.absent(),
    this.url = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.disabled = const Value.absent(),
    this.description = const Value.absent(),
  });
  MyAddressesCompanion.insert({
    this.id = const Value.absent(),
    required String postCode,
    required String prefecture,
    required String city,
    required String address1,
    required String address2,
    this.url = const Value.absent(),
    required DateTime updatedAt,
    required bool disabled,
    this.description = const Value.absent(),
  })  : postCode = Value(postCode),
        prefecture = Value(prefecture),
        city = Value(city),
        address1 = Value(address1),
        address2 = Value(address2),
        updatedAt = Value(updatedAt),
        disabled = Value(disabled);
  static Insertable<MyAddress> custom({
    Expression<int>? id,
    Expression<String>? postCode,
    Expression<String>? prefecture,
    Expression<String>? city,
    Expression<String>? address1,
    Expression<String>? address2,
    Expression<String>? url,
    Expression<DateTime>? updatedAt,
    Expression<bool>? disabled,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postCode != null) 'post_code': postCode,
      if (prefecture != null) 'prefecture': prefecture,
      if (city != null) 'city': city,
      if (address1 != null) 'address1': address1,
      if (address2 != null) 'address2': address2,
      if (url != null) 'url': url,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (disabled != null) 'disabled': disabled,
      if (description != null) 'description': description,
    });
  }

  MyAddressesCompanion copyWith(
      {Value<int>? id,
      Value<String>? postCode,
      Value<String>? prefecture,
      Value<String>? city,
      Value<String>? address1,
      Value<String>? address2,
      Value<String?>? url,
      Value<DateTime>? updatedAt,
      Value<bool>? disabled,
      Value<String?>? description}) {
    return MyAddressesCompanion(
      id: id ?? this.id,
      postCode: postCode ?? this.postCode,
      prefecture: prefecture ?? this.prefecture,
      city: city ?? this.city,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
      disabled: disabled ?? this.disabled,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (postCode.present) {
      map['post_code'] = Variable<String>(postCode.value);
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
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (disabled.present) {
      map['disabled'] = Variable<bool>(disabled.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyAddressesCompanion(')
          ..write('id: $id, ')
          ..write('postCode: $postCode, ')
          ..write('prefecture: $prefecture, ')
          ..write('city: $city, ')
          ..write('address1: $address1, ')
          ..write('address2: $address2, ')
          ..write('url: $url, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('disabled: $disabled, ')
          ..write('description: $description')
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
  required String postCode,
  required String prefecture,
  required String city,
  required String address1,
  required String address2,
  Value<String?> url,
  required DateTime updatedAt,
  required bool disabled,
  Value<String?> description,
});
typedef $$MyAddressesTableUpdateCompanionBuilder = MyAddressesCompanion
    Function({
  Value<int> id,
  Value<String> postCode,
  Value<String> prefecture,
  Value<String> city,
  Value<String> address1,
  Value<String> address2,
  Value<String?> url,
  Value<DateTime> updatedAt,
  Value<bool> disabled,
  Value<String?> description,
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

  ColumnFilters<String> get postCode => $composableBuilder(
      column: $table.postCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prefecture => $composableBuilder(
      column: $table.prefecture, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address1 => $composableBuilder(
      column: $table.address1, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address2 => $composableBuilder(
      column: $table.address2, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get disabled => $composableBuilder(
      column: $table.disabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get postCode => $composableBuilder(
      column: $table.postCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prefecture => $composableBuilder(
      column: $table.prefecture, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address1 => $composableBuilder(
      column: $table.address1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address2 => $composableBuilder(
      column: $table.address2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get disabled => $composableBuilder(
      column: $table.disabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get postCode =>
      $composableBuilder(column: $table.postCode, builder: (column) => column);

  GeneratedColumn<String> get prefecture => $composableBuilder(
      column: $table.prefecture, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get address1 =>
      $composableBuilder(column: $table.address1, builder: (column) => column);

  GeneratedColumn<String> get address2 =>
      $composableBuilder(column: $table.address2, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get disabled =>
      $composableBuilder(column: $table.disabled, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
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
            Value<String> postCode = const Value.absent(),
            Value<String> prefecture = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> address1 = const Value.absent(),
            Value<String> address2 = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> disabled = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              MyAddressesCompanion(
            id: id,
            postCode: postCode,
            prefecture: prefecture,
            city: city,
            address1: address1,
            address2: address2,
            url: url,
            updatedAt: updatedAt,
            disabled: disabled,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String postCode,
            required String prefecture,
            required String city,
            required String address1,
            required String address2,
            Value<String?> url = const Value.absent(),
            required DateTime updatedAt,
            required bool disabled,
            Value<String?> description = const Value.absent(),
          }) =>
              MyAddressesCompanion.insert(
            id: id,
            postCode: postCode,
            prefecture: prefecture,
            city: city,
            address1: address1,
            address2: address2,
            url: url,
            updatedAt: updatedAt,
            disabled: disabled,
            description: description,
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
