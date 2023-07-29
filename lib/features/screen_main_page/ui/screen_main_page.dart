import 'package:flutter/material.dart';
import 'package:student_app/features/add_student_screen.dart/ui/add_student.dart';
import 'package:student_app/features/update_screen/widgets/app_bar_widget.dart';
import 'package:student_app/features/screen_main_page/widgets/bottomNavigationWidget.dart';
import 'package:student_app/features/student_list_screen/ui/student_list.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    AddStudent(),
    StudentListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100), child: AppBarWidget()),
      body: SafeArea(
          child: ValueListenableBuilder(
        builder: (BuildContext context, int index, child) {
          return _pages[index];
        },
        valueListenable: indexChangeNotifier,
      )),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
