import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/pages/login.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';
import 'package:proyectoexportacion/pages/registro.dart';
import 'package:proyectoexportacion/pages/reports.dart';
import 'package:proyectoexportacion/providers/report_provider.dart';
import 'package:proyectoexportacion/widgets/voidreporttest.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReportProvider>(
          create: (context) => ReportProvider(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Transhipper',
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (context) => const Reports(),
          },
        );
      },
    );
    // return MaterialApp(
    //   title: 'Named Routes Demo',

    //   initialRoute: '/',
    //   routes: <String, WidgetBuilder>{
    //     // '/': (context) => const LoginTranshipper(),
    //     // 'Registrar': ((context) => const RegistroUsuario()),
    //     // 'Menu': (context) => const MenuPrincipal(),
    //     '/': (context) => const Reports(),
    //   },
    // );
  }
}
