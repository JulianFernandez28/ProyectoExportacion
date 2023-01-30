import 'package:flutter/material.dart';
import 'package:transhipper/widgets/listview.dart';
import 'package:transhipper/statements/search_bar.dart';
import 'package:transhipper/pages/caminoview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 19, 38, 145),
          title: const Center(
            child: Text(
              'Mis Envíos',
              style: TextStyle(fontSize: 30, fontFamily: 'Montserrat'),
            ),
          ),
          leading: const BackButtonIcon(),
        ),
        body: ListView(
          children: [
            infoGeneral,

            //const SearchBad(),
            /*cempasuchil(),
            nocheBuena(),
            lilium(),
            clavel(),
            boganvilia(),*/
          ],
        ),
      ),
    );
  }
}
