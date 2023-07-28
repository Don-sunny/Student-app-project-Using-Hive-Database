import 'package:flutter/material.dart';
import 'package:student_app/features/student_list_screen/widgets.dart/student_list_widget.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children:
                    List.generate(10, (index) => const StudentListWidget()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
