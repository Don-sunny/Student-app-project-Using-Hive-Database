import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  const TextFormFiledWidget(
      {super.key,
      this.height = 50,
      this.width = double.infinity,
      required this.hintText});
  final double height;
  final double width;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 5),
            ),
          ),
        ));
  }
}
