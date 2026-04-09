<<<<<<< HEAD
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:second/controller/auth/otp_controller.dart';
// import 'package:second/core/class/status_request.dart';
// import 'package:second/core/constant/imageassets.dart';
=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/auth/otp_controller.dart';
import 'package:second/core/class/status_request.dart';
import 'package:second/core/constant/imageassets.dart';
import 'package:second/view/screen/auth/login.dart';
>>>>>>> feature/store_and_product

// class OtpScreen extends StatelessWidget {
//   final String email;

//   const OtpScreen({super.key, required this.email});

<<<<<<< HEAD
//   @override
//   Widget build(BuildContext context) {
//     Get.put(OtpController(email));

//     return Scaffold(
//       body: GetBuilder<OtpController>(
//         builder: (controller) {
//           return Stack(
//             children: [
//               /// 🔥 BACKGROUND
//               SizedBox(
//                 width: double.infinity,
//                 height: double.infinity,
//                 child: Image.asset(
//                   ImageAsset.onBoardingImageOne,
//                   fit: BoxFit.cover,
//                 ),
//               ),

//               /// GRADIENT
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.black.withOpacity(0.3), Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//               ),

//               /// CARD
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   margin: const EdgeInsets.all(20),
//                   padding: const EdgeInsets.all(25),
//                   height: 400,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: Colors.white.withOpacity(0.2)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Verify Account",
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),

//                       const SizedBox(height: 10),

//                       const Text(
//                         "Enter the OTP sent to your email",
//                         style: TextStyle(color: Colors.white70),
//                       ),

//                       const SizedBox(height: 30),

//                       /// OTP FIELD
//                       TextField(
//                         controller: controller.otpController,
//                         keyboardType: TextInputType.number,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           letterSpacing: 5,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "ــــــ",
//                           hintStyle: const TextStyle(color: Colors.white54),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.15),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 25),

//                       /// BUTTON
//                       SizedBox(
//                         width: double.infinity,
//                         height: 55,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             controller.verifyOtp();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.black,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           child:
//                               controller.statusRequest == StatusRequest.loading
//                                   ? const CircularProgressIndicator()
//                                   : const Text(
//                                       "Verify",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                         ),
//                       ),

//                       const SizedBox(height: 15),

//                       /// RESEND
//                       TextButton(
//                         onPressed: () {
//                           // resend OTP API
//                         },
//                         child: const Text(
//                           "Resend Code",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
=======
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
>>>>>>> feature/store_and_product
