//
// import 'package:flutter/material.dart';
//
// //Add this CustomPaint widget to the Widget Tree
// class TestTest extends StatefulWidget {
//   const TestTest({super.key, });
//
//   @override
//   State<TestTest> createState() => _TestTestState();
//
// }
//
// class _TestTestState extends State<TestTest> {
//   @override
//   Widget build(BuildContext context) {
//     var width=MediaQuery.of(context).size.width;
//     return ClipRRect(
//
//       child: CustomPaint(
//         size: Size(width/2, width/2), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//         painter: RPSCustomPainter(),
//       ),
//     );
//   }
// }
//
// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//
//     Paint paint0Fill = Paint()..strokeWidth=6
//       ..style=PaintingStyle.stroke;
//     paint0Fill.color = Colors.white.withOpacity(1.0);
//     canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.5000000,size.height*0.5000000),width:size.width/1.2,height:size.height/1.9),paint0Fill);
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }