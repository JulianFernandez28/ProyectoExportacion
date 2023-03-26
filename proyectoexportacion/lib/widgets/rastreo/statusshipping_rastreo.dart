import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../env/datos.dart';
import '../../providers/rastreo_provider.dart';

class StatusShippinRastreo extends StatelessWidget {
  const StatusShippinRastreo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 228, 228, 228),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
                    child: ListTile(
                      leading: Icon(Icons.local_shipping_rounded),
                      title: Text(
                        "Estado de envio",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Consumer<RastreoProvider>(
              builder: (context, rastreoProvider, child) => rastreoProvider
                      .isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                        itemCount: rastreoProvider.rastreo?.length,
                        itemBuilder: (context, index) {
                          final rastreo = rastreoProvider.rastreo![index];
                          final fecha = rastreo.dateTimeActual
                              .toString()
                              .substring(0, 19);
                          Datos.estado = rastreo.statusEnvio;
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.all(4),
                            child: ListTile(
                              leading: const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.lightBlue,
                              ),
                              title: Text(rastreo.description),
                              subtitle: Text(
                                fecha,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 29, 52, 226)),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
        ],
      ),
    );
  }
}
