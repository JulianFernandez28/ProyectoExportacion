import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transhipper/provider/rastreo_provider.dart';
import 'package:transhipper/provider/ticket_provider.dart';
import 'package:transhipper/provider/user_provider.dart';
import 'package:transhipper/screens/home_screen.dart';
import 'package:transhipper/screens/rastreo_screen.dart';

void main() => runApp(const TransApp());

class TransApp extends StatelessWidget {
  const TransApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider()..getEnvios(),
        ),
        ChangeNotifierProvider(
          create: (context) => RastreoProvider()..getRastreo(),
        ),
        ChangeNotifierProvider(
            create: (context) => TicketProvider()..getTicket())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
