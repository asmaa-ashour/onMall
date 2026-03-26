import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:second/core/constant/imageassets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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

                    /// EMAIL
                    _customField("Email", Icons.email),

                    const SizedBox(height: 15),

                    /// PASSWORD
                    _customField("Password", Icons.lock),

                    const SizedBox(height: 10),

                    /// FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// SIGN IN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Or sign in with",
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

                    /// SIGN UP LINK
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Sign Up",
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
      ),
    );
  }

  /// INPUT FIELD
  Widget _customField(String hint, IconData icon) {
    return TextField(
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
