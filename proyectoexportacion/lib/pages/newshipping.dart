import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:proyectoexportacion/dtos/responses/producto_response_dto.dart';
import 'package:proyectoexportacion/models/user.dart';
import 'package:proyectoexportacion/providers/envio_provides.dart';
import 'package:proyectoexportacion/providers/product_provider.dart';
import 'package:proyectoexportacion/widgets/card_title.dart';
import 'package:proyectoexportacion/widgets/labeltext.dart';
import '../dtos/request/envio_create_request.dart';
import '../widgets/shipping/card_details_user.dart';
import '../widgets/shipping/detail_flor_shipping.dart';

class NewShipping extends StatefulWidget {
  const NewShipping({super.key});

  @override
  State<NewShipping> createState() => _NewShippingState();
}

class _NewShippingState extends State<NewShipping> {
  String? productSelect;
  String? transporteSelect;

  List<ProductResponseDto> _products = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _products = Provider.of<ProductProvider>(context).producs ?? [];
  }

  void openFileS() async {
    FilePickerResult? resultfile = await FilePicker.platform.pickFiles();

    if (resultfile != null) {
      PlatformFile file = resultfile.files.first;
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.path);
    }
  }

  final logger = Logger();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final pesoController = TextEditingController();
  final medidasController = TextEditingController();
  final curpUserController = TextEditingController();
  final sourceLocartionController = TextEditingController();
  final cpController = TextEditingController();
  final estadoController = TextEditingController();
  final municipioController = TextEditingController();
  final calleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        title: Text("Nuevo envio"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        key: formkey1,
                        child: Column(
                          children: [
                            const TitleCards(
                                title: "Detalles del envio",
                                icons: Icons.local_shipping_rounded),
                            const Divider(
                              thickness: 2,
                            ),
                            DropdownButtonFormField(
                              icon: const Icon(Icons.local_florist_rounded),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              isExpanded: true,
                              value: productSelect,
                              hint: const Text(
                                "Tipo de flor",
                                style: TextStyle(fontSize: 15),
                              ),
                              items: _products.map(
                                (e) {
                                  return DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(e.name));
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
                                  productSelect = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            LabelTextFlor(
                                pesoController: pesoController,
                                medidasController: medidasController),
                            const SizedBox(
                              height: 15,
                            ),
                            LabelText(
                                nameController: sourceLocartionController,
                                tipodevalor: "Ubicacion de envio",
                                iconsufflixIcon: Icons.location_on_outlined,
                                ejemploValor: ""),
                            ElevatedButton(
                                onPressed: () {
                                  openFileS();
                                },
                                child: Text("Selecciionar docucmento"))
                          ],
                        )),
                  ),
                ),
                CardDetailsUser(
                    formKey: formkey2,
                    curpUserController: curpUserController,
                    cpController: cpController,
                    estadoController: estadoController,
                    municipioController: municipioController,
                    calleController: calleController)
              ],
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formkey1.currentState!.validate() ||
              formkey2.currentState!.validate()) {
            var envio = EnvioCreateRequestDto(
                title: "Envio de ",
                productId: int.tryParse(productSelect!)!,
                weightContent: pesoController.text,
                measures: medidasController.text,
                sourceLocation: sourceLocartionController.text,
                destinationLocation: municipioController.text +
                    ", " +
                    estadoController.text +
                    ", " +
                    cpController.text +
                    ", " +
                    calleController.text,
                curpUserSubmit: User.curp,
                curpClient: curpUserController.text,
                placaTransport: "AAA-000-A");

            print(envio.toJson());
            await showSummaryDialog(context, envio);
          }

          formkey1.currentState!.reset();
          formkey1.currentState!.reset();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

showSummaryDialog(BuildContext context, EnvioCreateRequestDto envio) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Resumen de datos'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Codigo de producto: ${envio.productId}'),
            const SizedBox(height: 10.0),
            Text('Peso: ${envio.weightContent}'),
            const SizedBox(height: 10.0),
            Text('Medidas: ${envio.measures}'),
            const SizedBox(height: 10.0),
            Text('Ubicacion origen: ${envio.sourceLocation}'),
            const SizedBox(height: 10.0),
            Text('CURP del cliente: ${envio.curpClient}'),
            const SizedBox(height: 10.0),
            Text('Ubicacion de destino: ${envio.destinationLocation}'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cerrar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
              child: Text('Completar'),
              onPressed: () {
                context.read<EnvioProvider>().createEnvio(envio, context);
              }),
        ],
      );
    },
  );
}
