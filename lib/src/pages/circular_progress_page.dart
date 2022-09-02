import 'dart:math';

import 'package:b_circular_progress/main.dart';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
   
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;
    
    Offset center = Offset(size.width*0.5, size.height/2); 
    double radius = min(size.width*0.5, size.height*0.5);

    canvas.drawCircle(center, radius, paint);
    


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;


}