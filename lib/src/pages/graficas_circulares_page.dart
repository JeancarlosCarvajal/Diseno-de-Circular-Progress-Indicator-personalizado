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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple,),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.lightGreen,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.indigoAccent,),
            ],
          )


        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color
  }) : super(key: key);

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Container(
          width: 180,
          height: 180,
          // color: Colors.red, // pruebas
          // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0), // pruebas
          child: RadialProgress(
            porcentaje: porcentaje,
            colorPrimario: this.color,
            colorSecundario: Colors.grey,
            grosorSecundario: 8.0,
            grosorPrimario: 15.0
          ),  
      ), 
    );
  }
}