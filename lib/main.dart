import 'package:elevate_task/core/di.dart';
import 'package:flutter/material.dart';

import 'my_app/my_app.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
