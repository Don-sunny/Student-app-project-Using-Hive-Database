import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_app/features/detailed_screen/widgets/user_details_container.dart';

class DetailedScreen extends StatelessWidget {
  DetailedScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      this.imagePath});

  final String name;
  final String email;
  final String phone;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 600,
              width: 370,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  imagePath != null
                      ? ClipOval(
                          child: Image.file(
                            File(imagePath!),
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        )
                      : ClipOval(
                          child: Image.asset(
                            'assets/images/avartar_image.png',
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                  UserDetails(
                    detail: name,
                    icon: Icons.person,
                  ),
                  UserDetails(
                    detail: email,
                    icon: Icons.email,
                  ),
                  UserDetails(
                    detail: phone,
                    icon: Icons.phone,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
