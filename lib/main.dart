import 'dart:io';

import 'package:crud_data/JSON/home.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'JSON/json_logics.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
  initializeJSON();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.black12,
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
          labelMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      home: const JsonHome(),
      // home: const MainHome(),
    );
  }
}


