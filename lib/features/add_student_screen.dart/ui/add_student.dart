import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/features/add_student_screen.dart/widgets/text_form_widget.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

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
                  height: 500,
                  width: 350,
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
                    // color: Colors.,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 90,
                        // backgroundColor: Colors.white,
                        backgroundImage: const AssetImage(
                          'assets/images/avartar_image.png',
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 30,
                              bottom: 30,
                              child: Container(
                                height: 30,
                                width: 30,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    // borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 7,
                                          blurRadius: 10),
                                    ]),
                                child: const Icon(
                                  CupertinoIcons.add,
                                  size: 25,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const TextFormFiledWidget(hintText: 'Enter your name'),
                      const TextFormFiledWidget(
                        hintText: 'Enter your mail id',
                      ),
                      const TextFormFiledWidget(
                          hintText: 'Enter your phone number'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            margin: const EdgeInsets.only(top: 15, right: 10),
                            child: TextButton(
                              onPressed: () {},
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
