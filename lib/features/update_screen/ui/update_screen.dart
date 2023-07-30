import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/db/student_model.dart';
import 'package:student_app/features/add_student_screen.dart/widgets/text_form_widget.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen(
      {super.key,
      required this.name,
      required this.emailid,
      required this.phone,
      required this.id,
      this.profile});

  final String name;
  final String emailid;
  final String phone;
  final int id;
  String? profile;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController? nameEditingController;
  TextEditingController? emialEditingController;
  TextEditingController? numberEditingController;
  String? imagePath;
  @override
  void initState() {
    nameEditingController = TextEditingController(text: widget.name);
    emialEditingController = TextEditingController(text: widget.emailid);
    numberEditingController = TextEditingController(text: widget.phone);
    imagePath = widget.profile;
    super.initState();
  }

  Box<StudentModel> studentBox = Hive.box<StudentModel>('student_model');
  File? image;

  Future<void> picker() async {
    final imageSelected =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      setState(() {
        image = File(imageSelected.path);
        imagePath = image!.path;
      });
    } else {
      imagePath = 'assets/images/avartar_image.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 600,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/background_image.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.dstATop,
                      ),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          await picker();
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape
                                    .circle, // Set the container shape to a circle
                              ),
                              child: imagePath != null
                                  ? ClipOval(
                                      child: Image.file(
                                        File(imagePath!),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.asset(
                                        widget.profile!,
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 20,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(CupertinoIcons.add),
                              ),
                            )
                          ],
                        ),
                      ),
                      TextFormFiledWidget(
                        hintText: 'Enter your name',
                        controller: nameEditingController!,
                      ),
                      TextFormFiledWidget(
                        hintText: 'Enter your mail id',
                        controller: emialEditingController!,
                      ),
                      TextFormFiledWidget(
                        hintText: 'Enter your phone number',
                        controller: numberEditingController!,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            margin: const EdgeInsets.only(top: 15, right: 10),
                            child: TextButton(
                              onPressed: () {
                                if (nameEditingController!.text.isNotEmpty &&
                                    emialEditingController!.text.isNotEmpty &&
                                    numberEditingController!.text.isNotEmpty) {
                                  StudentModel updateStudent = StudentModel(
                                    name: nameEditingController!.text,
                                    emailId: emialEditingController!.text,
                                    phone: numberEditingController!.text,
                                    imagePath: imagePath ??
                                        'assets/images/avartar_image.png',
                                  );
                                  studentBox.put(widget.id, updateStudent);
                                  Navigator.pop(context);
                                  // nameEditingController!.text = '';
                                  // emialEditingController!.text = '';
                                  // numberEditingController!.text = '';
                                  // imagePath = 'assets/images/avartar_image.png';
                                } else {
                                  return;
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
