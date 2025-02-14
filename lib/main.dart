import 'package:flutter/material.dart';

import 'app/presentation/pages/home/presentation/pages/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()),
  );
}
