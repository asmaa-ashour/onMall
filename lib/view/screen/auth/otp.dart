import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/imageassets.dart';

import '../../../controller/auth/Otp_Controller.dart';
import '../home/HomePage.dart';


class OtpScreen extends StatelessWidget {
  final String email; // تمرير الايميل من SignUpScreen
  OtpScreen({super.key, required this.email});

  final TextEditingController otpController = TextEditingController();
  final OtpController otpControllerInstance = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND IMAGE
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageAsset.onBoardingImageThree,
              fit: BoxFit.cover,
            ),
          ),

          /// GRADIENT
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.15),
                ],
              ),
            ),
          ),

          /// GLASS CARD
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

                    /// OTP FIELD
                    _customField("Enter OTP", Icons.lock, otpController),
                    const SizedBox(height: 25),

                    /// VERIFY BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: GetBuilder<OtpController>(
                        builder: (_) => ElevatedButton(
                          onPressed: () async {
                            await otpControllerInstance.verifyOtp(
                                email, otpController.text.trim());

                            if (otpControllerInstance.statusRequest ==
                                    StatusRequest.success &&
                                otpControllerInstance.isVerified) {
                              Get.offAll(() => const HomePage());
                            } else {
                              Get.snackbar(
                                "Error",
                                "Invalid OTP. Try again.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                    Colors.red.withOpacity(0.7),
                                colorText: Colors.white,
                              );
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
                                    fontWeight: FontWeight.bold,
                                  ),
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

  /// CUSTOM FIELD
  Widget _customField(
      String hint, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}