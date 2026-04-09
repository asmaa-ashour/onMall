import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/auth/log_in_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/class/cacheClass%20.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/screen/home/HomePage.dart';

class SignInScreen extends StatelessWidget {
  final String? email; // البريد من OTP إذا موجود

  SignInScreen({super.key, this.email});

  // Controllers للـ input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // LoginController
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // ⬅️ عبّي البريد الإلكتروني إذا جاء من OTP
    if (email != null) {
      emailController.text = email!;
    }

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
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // EMAIL FIELD
                    _customField("Email", Icons.email, emailController),
                    const SizedBox(height: 15),

                    // PASSWORD FIELD
                    _customField("Password", Icons.lock, passwordController),
                    const SizedBox(height: 10),

                    // SIGN IN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: GetBuilder<LoginController>(
                        builder: (_) => ElevatedButton(
                          onPressed: () async {
                            // تسجيل الدخول
                            await loginController.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                            // تحديث الـ GetBuilder بعد login
                            loginController.update();

                            // تحقق من نجاح تسجيل الدخول
                            if (loginController.statusRequest ==
                                    StatusRequest.success &&
                                loginController.loginModel?.status ==
                                    'success') {
                              // حفظ التوكن في الكاش
                              await CacheClass.setData(
                                key: "Token",
                                value: loginController.loginModel!.token,
                              );

                              // التحقق من أن التوكن محفوظ
                              String? savedToken =
                                  CacheClass.getData(key: "Token");
                              print("Token stored in CacheClass: $savedToken");

                              // عرض SnackBar لتأكيد الحفظ
                              Get.snackbar(
                                "Login Successful",
                                "Token stored: ${savedToken ?? "No Token"}",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green.withOpacity(0.8),
                                colorText: Colors.white,
                              );
                              // الانتقال للصفحة الرئيسية بعد تأخير بسيط
                              await Future.delayed(
                                  const Duration(milliseconds: 150));
                              Get.offAll(() => const HomePage());
                            } else {
                              // فشل تسجيل الدخول
                              Get.snackbar(
                                "Error",
                                loginController.loginModel?.message ??
                                    "Login failed",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red.withOpacity(0.7),
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
                          child: loginController.statusRequest ==
                                  StatusRequest.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.black)
                              : const Text(
                                  "Sign In",
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

  /// INPUT FIELD
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
    );
  }
}
