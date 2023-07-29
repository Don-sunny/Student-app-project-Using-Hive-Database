import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String emailId;
  @HiveField(2)
  String? imagePath;
  @HiveField(3)
  final String phone;

  StudentModel({
    required this.name,
    required this.emailId,
    required this.phone,
    this.imagePath,
  });
}
