import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/screen/auth/login.dart';
import 'package:second/view/screen/home/HomePage.dart';

import '../../../controller/auth/Otp_Controller.dart';


class OtpScreen extends StatelessWidget {
  final String email;
  OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final OtpController otpControllerInstance = Get.put(OtpController(email));

    return Scaffold(
      body: Stack(
        children: [
          // خلفية
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageAsset.onBoardingImageThree,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.15)],
              ),
            ),
          ),
          // Glass Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(25),
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Enter the code sent to $email",
                      style: const TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    // OTP FIELD
                    TextField(
                      controller: otpControllerInstance.otpController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    // ✅ زر إعادة إرسال OTP
      GetBuilder<OtpController>(
        init: otpControllerInstance,
  builder: (controller) => TextButton(
    onPressed: controller.canResend
        ? () async {
            await controller.resendOtp();
          }
        : null,
    child: controller.isResending
        ? const CircularProgressIndicator(color: Colors.white)
        : Text(
            controller.canResend
                ? "Didn't receive the code? Resend"
                : "Resend in ${controller.resendSeconds}s",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
  ),
),
                    const SizedBox(height: 25),
                    // VERIFY BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: GetBuilder<OtpController>(
                        builder: (_) => ElevatedButton(
                          onPressed: () async {
                            await otpControllerInstance.verifyOtp();

                            if (otpControllerInstance.statusRequest ==
                                    StatusRequest.success &&
                                otpControllerInstance.isVerified) {
                  Get.offAll(() => SignInScreen(email: email)); // ممكن تمرر الإيميل لتسهيل عملية الملء
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 10,
                          ),
                          child: otpControllerInstance.statusRequest ==
                                  StatusRequest.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : const Text(
                                  "Verify",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}