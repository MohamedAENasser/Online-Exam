import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/di.dart';

import 'my_app/my_app.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}



