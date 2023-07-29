import 'package:hive_flutter/adapters.dart';
import 'package:student_app/db/student_model.dart';

List<StudentModel> getList() {
  Box box = Hive.box<StudentModel>('student_model');
  List<StudentModel> list = [];
  for (int i = 0; i < box.length; i++) {
    list.add(box.getAt(i));
  }
  return list;
}
