import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/auth/sign_up_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/screen/auth/otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return Stack(
          children: [
            /// BACKGROUND IMAGE
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                ImageAsset.onBoardingImageOne,
                fit: BoxFit.cover,
              ),
            ),
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
                height: 520,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),
                      _customField("Full Name", Icons.person, controller.name),
                      const SizedBox(height: 15),

                      _customField("Email", Icons.email, controller.email),
                      const SizedBox(height: 15),

                      _customField("Password", Icons.lock, controller.password),
                      const SizedBox(height: 15),
                      _customField(
                          "Phone Number", Icons.phone, controller.phone),
                      const SizedBox(height: 25),

                      /// SIGN UP BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.signup();
                            Get.to(
                                () => OtpScreen(email: controller.email.text));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 10,
                          ),
                          child:
                              controller.statusRequest == StatusRequest.loading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Or sign up with",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 15),

                      /// SOCIAL LOGIN
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(Icons.g_mobiledata),
                          const SizedBox(width: 20),
                          _socialButton(Icons.apple),
                          const SizedBox(width: 20),
                          _socialButton(Icons.facebook),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// LOGIN LINK
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  /// CUSTOM FIELD
  Widget _customField(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller, // 🔥 الربط
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

  /// SOCIAL BUTTON
  Widget _socialButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
