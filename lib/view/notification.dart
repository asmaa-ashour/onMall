import 'package:flutter/material.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/core/constant/color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple)),
      ),
      body: const Center(child: Text("Notification Screen")),
    );
  }
}
