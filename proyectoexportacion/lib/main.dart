import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/login.dart';
import 'package:proyectoexportacion/widgets/firstscreen.dart';

import 'package:proyectoexportacion/widgets/perfilscreen.dart';

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
        '/': (context) => const LoginTranshipper(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'login': ((context) => const FirstScreen()),
        'second': (context) => const SecondScreen(),
        'perfil': ((context) => const PerfilUser())
      },
    ),
  );
}
