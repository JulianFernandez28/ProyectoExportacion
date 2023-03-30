import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/dtos/request/status_request_dto.dart';
import 'package:proyectoexportacion/models/user.dart';

import '../../dtos/responses/rastreo_response.dart';
import '../../env/datos.dart';
import '../../providers/rastreo_provider.dart';

class StatusShippinRastreo extends StatefulWidget {
  const StatusShippinRastreo({
    super.key,
  });

  @override
  State<StatusShippinRastreo> createState() => _StatusShippinRastreoState();
}

class _StatusShippinRastreoState extends State<StatusShippinRastreo> {
  RastreoResponseDto? status;

  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    _isInit = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        Provider.of<RastreoProvider>(context).getRastreo(Datos.count);
      });
    }
  }

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 3.0),
                    child: ListTile(
                      leading: const Icon(Icons.local_shipping_rounded),
                      title: const Text(
                        "Estado de envio",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      trailing: Builder(
                        builder: (context) {
                          if (User.role == "Transportista") {
                            return TextButton(
                                onPressed: () async {
                                  await showFormUpdate(context);
                                },
                                child: const Text("Actualizar"));
                          }
                          return const Text("");
                        },
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
          Consumer<RastreoProvider>(builder: (context, rastreoProvider, child) {
            if (rastreoProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (rastreoProvider.rastreo!.isEmpty) {
              status = null;
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(4),
                child: const ListTile(
                  leading: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.lightBlue,
                  ),
                  title: Text("En revision"),
                  subtitle: Text(
                    "",
                    style: TextStyle(color: Color.fromARGB(255, 29, 52, 226)),
                  ),
                ),
              );
            }

            return StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: rastreoProvider.rastreo?.length,
                    itemBuilder: (context, index) {
                      final rastreo = rastreoProvider.rastreo![index];
                      final fecha =
                          rastreo.dateTimeActual.toString().substring(0, 19);

                      status = rastreo;
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
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rastreo.actualLocation,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 29, 52, 226)),
                                ),
                                Text(
                                  fecha,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 29, 52, 226)),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  showFormUpdate(BuildContext context) {
    String? descripcion;
    const List<String> descripcionEnvio = [
      'En transito',
      'Paquete en almacen',
      'Paquete Recolectado',
      'Paquete en revision (Aduana)',
      'Paquete aprobado (Aduana)',
      'Paquete rechazado (Aduana)',
      'Paquete por Entregar',
      'Paquete entregado'
    ];

    const Map<int, String> estadoEnvio = {
      0: "En Camino",
      1: "Cancelado",
      2: "Completado"
    };
    int _selectedEstado = 0;
    final formkey1 = GlobalKey<FormState>();
    final ciudadController = TextEditingController();
    final estadoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Actualizacion de estado"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ciudadController,
                          decoration:
                              const InputDecoration(labelText: "Ciudad",hintText: "Ciudad"),
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Ajuste este valor según sea necesario
                      Expanded(
                        child: TextFormField(
                          controller: estadoController,
                          decoration:
                              const InputDecoration(labelText: "Estado",hintText: "Estado"),
                        ),
                      ),
                    ],
                  ),
                  DropdownButtonFormField(
                    icon: const Icon(Icons.description),
                    isExpanded: true,
                    hint: const Text(
                      "Description",
                      style: TextStyle(fontSize: 15),
                    ),
                    items: descripcionEnvio.map(
                      (e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      },
                    ).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Description';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        descripcion = value!;
                      });
                    },
                  ),
                  DropdownButtonFormField<int>(
                    icon:const Icon(Icons.art_track_outlined),
                    hint: const Text(
                      "Estado de envio",
                      style: TextStyle(fontSize: 15),
                    ),
                    items: estadoEnvio.entries.map((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.key,
                        child: Text(entry.value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Estado de envio';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedEstado = value!;
                      });
                    },
                  ),
                ],
              ))
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
                child: const Text('Completar'),
                onPressed: () {
                  if (status == null) {
                    final st = StatusRequestDto(
                        envioId: Datos.count,
                        actualLocation: Datos.sourceLocation,
                        lastLocation: Datos.sourceLocation,
                        description: descripcion!,
                        dateTimeActual: DateTime.now(),
                        statusEnvio: _selectedEstado);
                    context
                        .read<RastreoProvider>()
                        .createNewStatus(st, context);
                  } else {
                    final st = StatusRequestDto(
                        envioId: Datos.count,
                        actualLocation:
                            "${ciudadController.text}, ${estadoController.text} ",
                        lastLocation: status!.actualLocation,
                        description: descripcion!,
                        dateTimeActual: DateTime.now(),
                        statusEnvio: _selectedEstado);
                    context
                        .read<RastreoProvider>()
                        .createNewStatus(st, context);
                  }

                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}
