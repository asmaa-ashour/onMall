import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second/core/constant/color.dart';

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
                color: AppColor.prrimaryColor)),
      ),
      body: const Center(child: Text("Edit Personal Profile")),
    );
  }
}
