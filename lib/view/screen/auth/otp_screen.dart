import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/auth/otp_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/screen/auth/login.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // ✅ إنشاء الكونترولر مرة واحدة
    final MyOtpController controller = Get.put(MyOtpController(email));

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
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
                      controller: controller.otpController,
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
                    GetBuilder<MyOtpController>(
                      builder: (c) => TextButton(
                        onPressed: c.canResend
                            ? () async {
                                await c.resendOtp();
                              }
                            : null,
                        child: c.isResending
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : Text(
                                c.canResend
                                    ? "Didn't receive the code? Resend"
                                    : "Resend in ${c.resendSeconds}s",
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
                      child: GetBuilder<MyOtpController>(
                        builder: (c) => ElevatedButton(
                          onPressed: () async {
                            await c.verifyOtp();

                            if (c.statusRequest == StatusRequest.success &&
                                c.isVerified) {
                              Get.offAll(
                                () => SignInScreen(email: email),
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
                          child: c.statusRequest == StatusRequest.loading
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
}
