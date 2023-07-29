import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/db/student_model.dart';
import 'package:student_app/features/search_screen/widgets/search_list.dart';
import 'package:student_app/functions/search_function.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Box studentBox = Hive.box<StudentModel>('student_model');

  List<StudentModel> studentList = [];
  @override
  void initState() {
    studentList = getList();
    super.initState();
  }

  void search(String value) {
    List<StudentModel> result = [];
    if (value.isEmpty) {
      result = getList();
    } else {
      result = studentList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      studentList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 40,
                  ),
                ),
                // ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                          height: 50,
                          width: 400,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 10,
                                    blurRadius: 10),
                              ]),
                          child: TextFormField(
                            onChanged: (value) => search(value),
                            // controller: controller,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                              icon: Icon(Icons.search),
                              hintText: "Search here",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 5),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  studentList.length,
                  (index) => SearchList(
                    index: index,
                    studentBox: studentBox,
                    studentList: studentList,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
