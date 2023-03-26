import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../env/datos.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 228, 228, 228),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover, 
                        height: 100,
                        imageUrl: Datos.imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(Datos.nameProduct),
                        subtitle: Builder(
                          builder: (context) {
                            if (Datos.estado == 0) {
                              return const Text(
                                "En camino",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 34, 0, 255)),
                              );
                            }
                            if (Datos.estado == 1) {
                              return const Text("Cancelado",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)));
                            }
                            if (Datos.estado == 2) {
                              return const Text(
                                "Completo",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 255, 8)),
                              );
                            }

                            return Text("sin estado");
                          },
                        ),
                        isThreeLine: true,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
