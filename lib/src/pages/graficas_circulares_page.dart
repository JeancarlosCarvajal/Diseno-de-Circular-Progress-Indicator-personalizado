import 'package:b_circular_progress/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
   
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  late double porcentaje = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 5;
            if(porcentaje > 100){
              porcentaje = 0;
            } 
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
         child: Container(
            width: 300,
            height: 300,
            // color: Colors.red, // pruebas
            // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0), // pruebas
            child: RadialProgress(
              porcentaje: porcentaje,
              colorPrimario: Colors.purple,
              colorSecundario: Colors.black,
              grosorSecundario: 8.0,
              grosorPrimario: 15.0
            ),  
        ), 
      )
    );
  }
}