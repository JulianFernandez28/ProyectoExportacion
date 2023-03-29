import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/providers/envio_provides.dart';

import '../env/datos.dart';
import '../providers/rastreo_provider.dart';
import '../widgets/rastreo/location_rastreo_card.dart';
import '../widgets/rastreo/statusshipping_rastreo.dart';
import '../widgets/rastreo/topcard.dart';

class Rastreo extends StatefulWidget {
  const Rastreo({super.key});

  @override
  State<Rastreo> createState() => _RastreoState();
}

class _RastreoState extends State<Rastreo> {
  @override
  void initState() {
    Provider.of<RastreoProvider>(context, listen: false)
        .getRastreo(Datos.count);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rastreo'),
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
        leading: BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Datos.estado = 0;
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  TopCard(),
                  LocationCard(),
                  ScrollNotificationObserver(child: StatusShippinRastreo()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
