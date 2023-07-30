import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  const TextFormFiledWidget(
      {super.key,
      this.height = 50,
      this.width = double.infinity,
      required this.hintText,
      required this.controller});
  final double height;
  final double width;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 30),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 5),
            ),
          ),
        ));
  }
}
