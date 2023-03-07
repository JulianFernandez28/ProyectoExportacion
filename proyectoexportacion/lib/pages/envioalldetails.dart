import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:proyectoexportacion/dtos/responses/productbyid_response.dart';

import '../providers/envio_provides.dart';
import '../widgets/buttons_actions.dart';
import '../widgets/card_title.dart';

class EnvioAllDetails extends StatelessWidget {
  const EnvioAllDetails({super.key, this.idenvio});

  final idenvio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Informacion Envio"),
          backgroundColor: const Color.fromARGB(231, 15, 28, 141),
          actions: [
            IconButton(
                padding: const EdgeInsets.only(right: 10),
                onPressed: () {},
                icon: const Icon(
                  Icons.report,
                  color: Color.fromARGB(255, 241, 0, 0),
                  size: 33,
                ))
          ],
        ),
        body: SafeArea(
          child: FutureBuilder<EnvioAllResponseDto>(
            future: EnvioProvider().getEnviobyId(idenvio),
            builder: (context, envio) {
              var image = envio.data?.product.image;
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
                                color: const Color.fromARGB(255, 223, 223, 223),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: "$image",
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("${envio.data?.title}"),
                                                  Text(
                                                      "Tipo: ${envio.data?.product.name}"),
                                                  Text(
                                                      "Medidas: ${envio.data?.measures}")
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Center(
                                              child: Text(
                                                  "${envio.data?.sourceLocation}"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Center(
                                              child: Text(
                                                  "${envio.data?.destinationLocation}"),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Color.fromARGB(255, 233, 233, 233),
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
                                                    "Nombres: ${envio.data?.user.name}"),
                                                Text(
                                                    "Apellidos: ${envio.data?.user.lastName}"),
                                                Text(
                                                    "Correo electronico: ${envio.data?.user.emailAddres}"),
                                                Text(
                                                    "Telefono: ${envio.data?.user.numberPhone}"),
                                                Text(
                                                    "CURP: ${envio.data?.user.curp}"),
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
                                color: Color.fromARGB(255, 233, 233, 233),
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
                                                    "No. de envio: ${envio.data?.id}"),
                                                Text(
                                                    "Fecha de envio: ${envio.data?.createOn}"),
                                                Text(
                                                    "Placa del vehiculo: ${envio.data?.placaTransport}"),
                                                Text(
                                                    "Curp del cliente: ${envio.data?.curpUserSubmit}"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ButtonsActions(
                                route: "/Menu",
                              )
                            ],
                          ),
                        ),
                      ));
            },
          ),
        ));
  }
}
