import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_app/db/student_model.dart';
import 'package:student_app/features/detailed_screen/detailed_screen.dart';

// ignore: must_be_immutable
class StudentListWidget extends StatelessWidget {
  StudentListWidget(
      {super.key,
      required this.name,
      required this.emailId,
      required this.phone,
      required this.index,
      this.imagePath});

  final String name;
  final String emailId;
  final String phone;
  String? imagePath;
  final int index;

  Box studentBox = Hive.box<StudentModel>('student_model');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedScreen(
                name: name,
                email: emailId,
                phone: phone,
                imagePath: imagePath,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(13),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            imagePath != null
                ? ClipOval(
                    child: Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      'assets/images/avartar_image.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10),
                        ]),
                    child: const Icon(
                      CupertinoIcons.pencil,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 10,
                              blurRadius: 10),
                        ]),
                    child: InkWell(
                      onTap: () {
                        studentBox.deleteAt(index);
                      },
                      child: const Icon(
                        CupertinoIcons.delete,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
