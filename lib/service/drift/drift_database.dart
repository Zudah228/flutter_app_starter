import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../repository/my_address/models/my_address.dart';

part 'drift_database.g.dart';

@DriftDatabase(tables: [MyAddresses])
class AppDriftDatabase extends _$AppDriftDatabase {
  AppDriftDatabase() : super(driftDatabase(name: 'app_db'));

  static final instance = AppDriftDatabase();

  @override
  int get schemaVersion => 1;
}
