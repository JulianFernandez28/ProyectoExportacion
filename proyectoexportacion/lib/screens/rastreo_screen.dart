import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/widgets/card_title.dart';

import '../env/datos.dart';
import '../providers/rastreo_provider.dart';
import '../widgets/create_buttons.dart';
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
        leading: const BackButton(color: Color.fromARGB(255, 255, 255, 255)),
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
