import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/db/student_model.dart';
import 'package:student_app/features/student_list_screen/widgets.dart/student_list_widget.dart';

ValueNotifier<List<StudentModel>> sudentListNotifier = ValueNotifier([]);

// ignore: must_be_immutable
class StudentListScreen extends StatelessWidget {
  StudentListScreen({super.key});

  Box studentBox = Hive.box<StudentModel>('student_model');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: studentBox.listenable(),
                builder: (BuildContext context, Box box, _) {
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: List.generate(box.length, (index) {
                      StudentModel student = box.getAt(index);
                      sudentListNotifier.value.add(student);
                      return StudentListWidget(
                        name: student.name,
                        emailId: student.emailId,
                        phone: student.phone,
                        index: index,
                        imagePath: student.imagePath,
                        id: student.key,
                      );
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
