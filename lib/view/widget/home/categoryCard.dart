// import 'package:flutter/material.dart';

// class AreaCard extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final bool isImageLeft;
//   final List<Color> gradientColors;

//   const AreaCard({
//     super.key,
//     required this.name,
//     required this.imageUrl,
//     required this.isImageLeft,
//     required this.gradientColors,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 110,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: LinearGradient(
//           colors: gradientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             spreadRadius: 1,
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(24),
//         child: isImageLeft
//             ? Row(
//                 children: [
//                   // Image on left with curve effect
//                   ClipPath(
//                     clipper: const RightCurveClipper(),
//                     child: Container(
//                       width: 100,
//                       height: 110,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(imageUrl),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Content on right
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black87,
//                               letterSpacing: -0.3,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Container(
//                             width: 40,
//                             height: 3,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF9C27B0).withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(2),
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           const Text(
//                             'Explore →',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xFF9C27B0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             : Row(
//                 children: [
//                   // Content on left
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black87,
//                               letterSpacing: -0.3,
//                             ),
//                             textAlign: TextAlign.right,
//                           ),
//                           const SizedBox(height: 6),
//                           Container(
//                             width: 40,
//                             height: 3,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF9C27B0).withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(2),
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           const Text(
//                             'Explore →',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xFF9C27B0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Image on right with curve effect
//                   ClipPath(
//                     clipper: const LeftCurveClipper(),
//                     child: Container(
//                       width: 100,
//                       height: 110,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(imageUrl),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// // Custom clipper for curved effect on right side
// class RightCurveClipper extends CustomClipper<Path> {
//   const RightCurveClipper();

//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width - 15, size.height);
//     path.quadraticBezierTo(
//       size.width,
//       size.height / 2,
//       size.width - 15,
//       0,
//     );
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// // Custom clipper for curved effect on left side
// class LeftCurveClipper extends CustomClipper<Path> {
//   const LeftCurveClipper();

//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(15, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(15, size.height);
//     path.quadraticBezierTo(
//       0,
//       size.height / 2,
//       15,
//       0,
//     );
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
