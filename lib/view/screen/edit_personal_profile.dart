import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second/core/constant/app_constants.dart';

class EditPersonalProfile extends StatelessWidget {
  const EditPersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Personal Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple)),
      ),
      body: const Center(child: Text("Edit Personal Profile")),
    );
  }
}
