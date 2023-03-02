import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/pages/detallesenvio.dart';
import 'package:proyectoexportacion/pages/login.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';
import 'package:proyectoexportacion/pages/registro.dart';
import 'package:proyectoexportacion/providers/envio_provides.dart';
import 'package:proyectoexportacion/providers/product_provider.dart';
import 'package:proyectoexportacion/providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<EnvioProvider>(
          create: (context) => EnvioProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider()..getProducts(),
        )
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Transhipper',
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (context) => const LoginTranshipper(),
            '/Registrar': ((context) => const RegistroUsuario()),
            '/Menu': (context) => const MenuPrincipal(),
            '/envio': (context) => const NuevoEnvio(),
          },
        );
      },
    );
  }
}
