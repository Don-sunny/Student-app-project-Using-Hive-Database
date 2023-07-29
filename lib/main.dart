import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_app/db/student_model.dart';
import 'package:student_app/features/screen_main_page/ui/screen_main_page.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
  useMaterial3: true,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.openBox<StudentModel>('student_model');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MainScreen(),
    );
  }
}
