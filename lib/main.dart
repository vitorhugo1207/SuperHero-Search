import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:superhero_search/sqllite/open_database.dart';
import 'screens/home_screen.dart';

void main() {
  openDatabaseConnection().catchError((error) {
    log('Error opening database: $error');
  });
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}