import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/db/student_model.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.index,
    required this.studentBox,
    required this.studentList,
  });
  final int index;
  final Box studentBox;
  final List<StudentModel> studentList;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          studentList[index].imagePath != null
              ? ClipOval(
                  child: Image.file(
                    File(studentList[index].imagePath!),
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                )
              : ClipOval(
                  child: Image.asset(
                    'assets/images/avartar_image.png',
                    fit: BoxFit.cover,
                    width: 70,
                    height: 70,
                  ),
                ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                studentList[index].name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                studentList[index].emailId,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.pencil),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.delete))
            ],
          )
        ],
      ),
    );
  }
}
