import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second/core/constant/app_constants.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pay",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple)),
      ),
      body: const Center(child: Text("Pay Screen")),
    );
  }
}
