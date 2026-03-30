import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/auth/otp_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/imageassets.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpController(email));

    return Scaffold(
      body: GetBuilder<OtpController>(
        builder: (controller) {
          return Stack(
            children: [
              /// 🔥 BACKGROUND
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  ImageAsset.onBoardingImageOne,
                  fit: BoxFit.cover,
                ),
              ),

              /// GRADIENT
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),

              /// CARD
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(25),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Verify Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Enter the OTP sent to your email",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 30),

                      /// OTP FIELD
                      TextField(
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 5,
                        ),
                        decoration: InputDecoration(
                          hintText: "ــــــ",
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.verifyOtp();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child:
                              controller.statusRequest == StatusRequest.loading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Verify",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      /// RESEND
                      TextButton(
                        onPressed: () {
                          // resend OTP API
                        },
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
