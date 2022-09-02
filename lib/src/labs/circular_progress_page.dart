import 'dart:math';
import 'dart:ui';

import 'package:b_circular_progress/main.dart';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
   
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {

    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 800)
    );

    controller.addListener(() {
      // print('jean: controller: ${controller.value}');
      // lerpDouble interpola los porcentajes para medir la relacion de 1 a porcentaje
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
      
    });
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 5;
          if(porcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          // from: 0.0 es para que al darle forward se empiece desde cero
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje: porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;

  _MiRadialProgress({required this.porcentaje});

  // Circulo completado
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;
    
    final Offset center = new Offset(size.width * 0.5, size.height * 0.5); 
    final double radio = min( size.width * 0.5, size.height * 0.5 );

    canvas.drawCircle(center, radio, paint);
    
    // Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

    double arcAngle = (2 * pi) * ( porcentaje / 100 ); // (2 * pi) es unna vuelta completa

    // dibujar el arco
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;


}