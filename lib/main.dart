import 'package:b_circular_progress/src/pages/graficas_circulares_page.dart';
// import 'package:b_circular_progress/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenos App',
      home: GraficasCircularesPage(),
    );
  }
}