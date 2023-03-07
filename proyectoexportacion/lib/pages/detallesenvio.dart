import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/dtos/request/envio_create_request.dart';
import 'package:proyectoexportacion/providers/envio_provides.dart';

import 'package:proyectoexportacion/widgets/labeltext.dart';
import "package:http/http.dart" as http;

import 'package:shared_preferences/shared_preferences.dart';

class NuevoEnvio extends StatefulWidget {
  const NuevoEnvio({super.key});

  @override
  State<NuevoEnvio> createState() => _NuevoEnvioState();
}

class _NuevoEnvioState extends State<NuevoEnvio> {
  String? productselect;
  String? transportSelect;
  String? crup;
  var _curp = [];
  var _products = [];
  var _transporte = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
    getTransporte();
  }

  final logger = Logger();
  final formkey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final tipoController = TextEditingController();
  final pesoController = TextEditingController();
  final medidasControlle = TextEditingController();
  final origenController = TextEditingController();
  final destinoController = TextEditingController();
  final encarrgadoController = TextEditingController();
  final clienteController = TextEditingController();
  final placaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Detalles del envio"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ScrollNotificationObserver(
            child: ListView(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        child: Text(
                          "Relllene todos los campos",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 55, 5, 120)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LabelText(
                          nameController: tituloController,
                          tipodevalor: "Titulo",
                          ejemploValor: 'Traslado de ',
                          iconsufflixIcon: Icons.new_label),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.local_florist_rounded),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              isExpanded: true,
                              value: productselect,
                              hint: const Text(
                                "Tipo",
                                style: TextStyle(fontSize: 15),
                              ),
                              items: _products.map(
                                (e) {
                                  return DropdownMenuItem(
                                    child: Text(e['name']),
                                    value: e['id'].toString(),
                                  );
                                },
                              ).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Por selecciona una tipo';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  productselect = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: LabelText(
                                nameController: pesoController,
                                tipodevalor: "Peso",
                                ejemploValor: '5kg',
                                iconsufflixIcon: Icons.scale),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: LabelText(
                                nameController: medidasControlle,
                                tipodevalor: "Medidas",
                                ejemploValor: "2x2",
                                iconsufflixIcon: Icons.straighten),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      LabelText(
                          nameController: origenController,
                          tipodevalor: "Direccion Origen",
                          ejemploValor: 'Merida,Yucatan',
                          iconsufflixIcon: Icons.pin_drop),
                      const SizedBox(
                        height: 15,
                      ),
                      LabelText(
                          nameController: destinoController,
                          tipodevalor: "Direccion de destino",
                          ejemploValor: 'Merida,Yucatan',
                          iconsufflixIcon: Icons.location_on),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        items: _curp.map((e) {
                          return DropdownMenuItem(
                            value: e.toString(),
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            crup = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      LabelText(
                          nameController: clienteController,
                          tipodevalor: "Curp del cliente",
                          ejemploValor: ' ',
                          iconsufflixIcon: Icons.person),
                      const SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        value: transportSelect,
                        icon: Icon(Icons.emoji_transportation_outlined),
                        hint: Text("Selecciona el transporte"),
                        items: _transporte.map(
                          (e) {
                            return DropdownMenuItem(
                                child: Text(e['placa']),
                                value: e['placa'].toString());
                          },
                        ).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Por selecciona una tipo';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            transportSelect = value!;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    backgroundColor:
                                        const Color.fromARGB(255, 211, 2, 2),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  formkey.currentState!.reset();
                                },
                                child: const Text("Reiniciar")),
                            ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    var envio = EnvioCreateRequestDto(
                                        title: tituloController.text,
                                        productId:
                                            int.tryParse(productselect!)!,
                                        weightContent: pesoController.text,
                                        measures: medidasControlle.text,
                                        sourceLocation: origenController.text,
                                        destinationLocation:
                                            destinoController.text,
                                        curpUserSubmit: crup!,
                                        curpClient: clienteController.text,
                                        placaTransport: transportSelect!);

                                    context
                                        .read<EnvioProvider>()
                                        .createEnvio(envio, context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    backgroundColor:
                                        const Color.fromARGB(255, 52, 11, 156),
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text("Confirmar"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //take the products
  Future getProducts() async {
    final local = await SharedPreferences.getInstance();
    var en = local.getString('curp');
    var key = local.getString("token");

    final response = await http.get(
        Uri.parse('http://www.transhipper.somee.com/api/Products/list'),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });

    if (response.statusCode == 200) {
      var jsonBody = response.body;
      final json = jsonDecode(jsonBody);

      setState(() {
        crup = en;
        _curp.add(crup);
        _products = json;
      });
    } else {
      throw Exception("Failed to load products");
    }
  }

  //take transport
  Future getTransporte() async {
    final local = await SharedPreferences.getInstance();
    var key = local.getString("token");

    final response = await http.get(
        Uri.parse('http://www.transhipper.somee.com/api/Transporte/list'),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $key"
        });

    if (response.statusCode == 200) {
      var jsonBody = response.body;
      final json = jsonDecode(jsonBody);

      setState(() {
        _transporte = json;
      });
    } else {
      throw Exception("Failed to load products");
    }
  }
}
