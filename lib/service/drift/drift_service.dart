import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'drift_database.dart';

part 'drift_service.g.dart';

@riverpod
DriftService driftService(Ref ref) {
  return DriftService(AppDriftDatabase.instance);
}

class DriftService {
  const DriftService(this._db);

  final AppDriftDatabase _db;

  AppDriftDatabase get db => _db;
}
