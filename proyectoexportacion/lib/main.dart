import 'package:flutter/material.dart';
import 'package:proyectoexportacion/widgets/firstscreen.dart';
import 'package:proyectoexportacion/widgets/fourscreen.dart';
import 'package:proyectoexportacion/widgets/perfilscreen.dart';
import 'package:proyectoexportacion/widgets/thirtscreen.dart';
import 'package:proyectoexportacion/widgets/secondscreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'second': (context) => const SecondScreen(),
        'thirt': (context) => const ThirtScreen(),
        'four': (context) => const FourScreen(),
        'perfil':((context) => const PerfilUser())
      },
    ),
  );
}
