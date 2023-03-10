import 'package:flutter/material.dart';

import '../widgets/createbuttom.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromRGBO(35, 46, 141, 25)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          //fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      children: const <Widget>[
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w500),
                        ),
                        CreateButton(
                          backfondo: Color.fromRGBO(133, 145, 255, 100),
                          nameButton: 'Nuevo Envio',
                          iconbutton: Icons.directions_boat_filled_outlined,
                          colorIcon: Color.fromRGBO(7, 16, 99, 100),
                          route: '/envio',
                        ),
                        CreateButton(
                          backfondo: Color.fromARGB(156, 180, 117, 219),
                          nameButton: 'Envios',
                          iconbutton: Icons.folder_copy_outlined,
                          colorIcon: Color.fromRGBO(87, 57, 124, 100),
                        ),
                        CreateButton(
                          backfondo: Color.fromARGB(156, 244, 186, 71),
                          nameButton: 'Rastreo',
                          iconbutton: Icons.not_listed_location,
                          colorIcon: Color.fromRGBO(135, 107, 7, 100),
                        ),
                        CreateButton(
                          backfondo: Color.fromARGB(156, 243, 120, 79),
                          nameButton: 'Perfil',
                          iconbutton: Icons.person,
                          colorIcon: Color.fromARGB(156, 134, 14, 48),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
