import 'package:flutter/material.dart';
import 'package:proyectoexportacion/pages/login.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';
import 'package:proyectoexportacion/pages/registro.dart';

import 'package:proyectoexportacion/widgets/perfilscreen.dart';


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
        'Registrar': ((context) => const RegistroUsuario()),
        'Menu': (context) => const MenuPrincipal(),
        'perfil': ((context) => const PerfilUser())
      },
    ),
  );
}
