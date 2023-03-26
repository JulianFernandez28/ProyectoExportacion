import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/pages/envioalldetails.dart';

import 'package:proyectoexportacion/providers/envio_provides.dart';

class UserEnvios extends StatelessWidget {
  const UserEnvios({super.key});

  @override
  Widget build(BuildContext context) {
    // final Envios = context.read<EnviosDto>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mis Envíos'),
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
      ),
      body: SafeArea(
        child: Card(
          elevation: 10.0,
          color: Colors.grey.shade200,
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              Consumer<EnvioProvider>(
                builder: (context, usersProvider, child) => usersProvider
                        .isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: usersProvider.envios?.length,
                          itemBuilder: (context, index) {
                            final user = usersProvider.envios![index];
                            final fecha =
                                user.createOn.toString().substring(0, 10);

                            final idEnvio = user.id;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(
                                    borderRadius:
                                        const BorderRadius.all(Radius.zero),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EnvioAllDetails(
                                              idenvio: idEnvio,
                                            ),
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
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
                                            imageUrl: user.product.image,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "${user.title} ${user.product.name}",
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "Cantidad: ${user.weightContent}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  "Fecha: $fecha",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
        onPressed: () {
          Navigator.of(context).pushNamed("/envio");
        },
        child: Icon(Icons.add_box_rounded),
      ),
    );
  }
}
