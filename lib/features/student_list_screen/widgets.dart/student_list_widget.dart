import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentListWidget extends StatelessWidget {
  const StudentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const CircleAvatar(
            // backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/avartar_image.png'),
            radius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                  child: const Icon(
                    CupertinoIcons.delete,
                    size: 25,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
