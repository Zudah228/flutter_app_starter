import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'drift_database.dart';

part 'drift_infrastructure.g.dart';

@riverpod
DriftInfrastructure driftInfrastructure(Ref ref) {
  return DriftInfrastructure(AppDriftDatabase.instance);
}

class DriftInfrastructure {
  const DriftInfrastructure(this._db);

  final AppDriftDatabase _db;

  AppDriftDatabase get db => _db;
}
