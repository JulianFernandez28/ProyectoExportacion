import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:proyectoexportacion/dtos/responses/envio_response_dto.dart';
import 'package:proyectoexportacion/pages/reports.dart';
import 'package:proyectoexportacion/screens/emptys/emptyenvios.dart';

import '../env/datos.dart';
import '../providers/envio_provides.dart';
import '../screens/emptys/emptydata.dart';
import '../widgets/buttons_actions.dart';
import '../widgets/card_title.dart';

class EnvioAllDetails extends StatelessWidget {
  const EnvioAllDetails({super.key, this.idenvio});

  final idenvio;
  Future<EnvioAllResponseDto> _getEnvioByIdWithDelay(int idenvios) async {
    await Future.delayed(const Duration(seconds: 1));
    return EnvioProvider().getEnviobyId(idenvios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Informacion Envio"),
          backgroundColor: const Color.fromARGB(231, 15, 28, 141),
          actions: [
            IconButton(
                padding: const EdgeInsets.only(right: 10),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Reports(),
                      ));
                },
                icon: const Icon(
                  Icons.report,
                  color: Color.fromARGB(255, 241, 0, 0),
                  size: 33,
                ))
          ],
        ),
        body: SafeArea(
            child: FutureBuilder<EnvioAllResponseDto>(
          future: _getEnvioByIdWithDelay(idenvio),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un widget mientras se espera a que el Future se resuelva
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data == null) {
              return EmptyEnvios();
            }

            // Aquí ya se ha resuelto el Future, se puede acceder a los datos con snapshot.data
            var envio = snapshot.data;
            var image = envio?.product.image;
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "Envio registrado",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Card(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.29,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          imageUrl: "$image",
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Text(
                                                    "${envio?.title} ${envio?.product.name}",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                    "Tipo: ${envio?.product.name}"),
                                                Text(
                                                    "Medidas: ${envio?.measures}"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 2,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Column(
                                children: [
                                  const TitleCards(
                                    icons: Icons.person,
                                    title: 'Informacion del personal',
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Nombres: ${envio?.user.name}"),
                                              Text(
                                                  "Apellidos: ${envio?.user.lastName}"),
                                              Text(
                                                  "Correo electronico: ${envio?.user.emailAddres}"),
                                              Text(
                                                  "Telefono: ${envio?.user.numberPhone}"),
                                              Text("CURP: ${envio?.user.curp}"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  const TitleCards(
                                    icons: Icons.local_shipping,
                                    title: 'Informacion envio',
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "No. de envio: ${envio?.id}"),
                                              Text(
                                                  "Fecha de envio: ${envio?.createOn}"),
                                              Text(
                                                  "Curp del cliente: ${envio?.curpClient}"),
                                              Text(
                                                  "Direccion: ${envio?.destinationLocation}")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 15),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 52, 11, 156),
                                                textStyle: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () {
                                              Datos.nameProduct =
                                                  envio!.product.name;
                                              Datos.sourceLocation =
                                                  envio.sourceLocation;
                                              Datos.destinoLocation =
                                                  envio.destinationLocation;
                                              Datos.imageUrl =
                                                  envio.product.image;
                                              Datos.count = envio.id;
                                              Navigator.of(context)
                                                  .pushNamed('/rastreo');
                                            },
                                            child: const Text("Rastreo")),
                                      ),
                                    ],
                                  ),
                                  ButtonsActions(
                                    route: "/Menu",
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
          },
        )));
  }
}
