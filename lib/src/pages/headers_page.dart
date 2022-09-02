
import 'package:b_circular_progress/src/labs/circular_progress_page.dart';
import 'package:flutter/material.dart';




class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(    
      body: CircularProgressPage(),      
    );
  }
}