import 'package:demo/core/presentation/app.dart';
import 'package:flutter/material.dart';

import 'config/dependances.dart';

Future<void> main() async {
  loadDependencies();

  runApp(const App());
}
