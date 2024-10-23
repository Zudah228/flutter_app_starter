import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'dependency_injection/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = await DIContainer.getContainer();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}
