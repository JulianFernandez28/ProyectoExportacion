import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/pages/envioalldetails.dart';
import 'package:proyectoexportacion/pages/newshipping.dart';
import 'package:proyectoexportacion/pages/reports.dart';
import 'package:proyectoexportacion/pages/userenvios.dart';
import 'package:proyectoexportacion/pages/login.dart';
import 'package:proyectoexportacion/pages/menuprincipal.dart';
import 'package:proyectoexportacion/pages/registro.dart';
import 'package:proyectoexportacion/providers/envio_provides.dart';
import 'package:proyectoexportacion/providers/product_provider.dart';
import 'package:proyectoexportacion/providers/rastreo_provider.dart';
import 'package:proyectoexportacion/providers/report_provider.dart';
import 'package:proyectoexportacion/providers/ticket_provider.dart';
import 'package:proyectoexportacion/providers/transporte_provider.dart';
import 'package:proyectoexportacion/providers/user_provider.dart';
import 'package:proyectoexportacion/screens/rastreo_screen.dart';
import 'package:proyectoexportacion/screens/useraccount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider<ReportProvider>(
          create: (context) => ReportProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider()..getProducts(),
        ),
        ChangeNotifierProvider<TransporteProvider>(
          create: (context) => TransporteProvider()..getTransporte(),
        ),
        ChangeNotifierProvider<EnvioProvider>(
          create: (context) => EnvioProvider(),
        ),
        ChangeNotifierProvider<EnvioProvider>(
          create: (context) => EnvioProvider()..getEnvios(),
        ),
        ChangeNotifierProvider<RastreoProvider>(
          create: (context) => RastreoProvider(),
        ),
        
        ChangeNotifierProvider(
            create: (context) => TicketProvider()..getTicket())
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
            '/envio': (context) => const NewShipping(),
            '/envioalldetails': (context) => const EnvioAllDetails(),
            '/rastreo': (context) => const Rastreo(),
            '/listEnvios': (context) => const UserEnvios(),
            '/useraccount': (context) => const UserAccount(),
            '/reports': (context) => const Reports()
          },
        );
      },
    );
  }
}
