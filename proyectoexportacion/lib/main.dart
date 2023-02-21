import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/pages/login.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';
import 'package:proyectoexportacion/pages/registro.dart';
import 'package:proyectoexportacion/providers/user_provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => const LoginTranshipper(),
          'Registrar': ((context) => const RegistroUsuario()),
          'Menu': (context) => const MenuPrincipal(),
        },
      ),
    );
  }
}
