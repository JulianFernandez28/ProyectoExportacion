import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transhipper/provider/ticket_provider.dart';
import 'package:transhipper/provider/user_provider.dart';
import 'package:transhipper/widgets/create_buttons.dart';
import 'package:transhipper/widgets/rastreo_screen.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    // final Envios = context.read<EnviosDto>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ticket'),
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
        leading: const BackButton(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: SafeArea(
        child: Card(
          elevation: 10.0,
          color: Colors.grey.shade200,
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              Consumer<TicketProvider>(
                builder: (context, usersProvider, child) => usersProvider
                        .isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                            itemCount: usersProvider.users?.length,
                            itemBuilder: (context, index) {
                              final user = usersProvider.users![index];
                              return Column(
                                children: <Widget>[
                                  const FlowerTurn(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: const BorderSide(),
                                        ),
                                        color: Colors.grey.shade300,
                                        shadowColor: const Color.fromRGBO(
                                            35, 46, 141, 25),
                                        elevation: 10,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Curp: ${user.curpClient}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Peso: ${user.weightContent}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Medidas Del Embalaje: ${user.measures}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Estado: ${user.status}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Numero De Producto: ${user.id}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                'Fecha De Creacion: ${user.createOn}',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 70,
                                      ),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: const BorderSide(),
                                        ),
                                        color: Colors.grey.shade300,
                                        shadowColor: const Color.fromRGBO(
                                            35, 46, 141, 25),
                                        elevation: 10,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Numero De Pedido: ${user.id}',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                'Fecha De Pago: ${user.updateOn}',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  const SizedBox(
                                    width: 150,
                                    height: 90,
                                    child: CreateButton(
                                        backfondo: Colors.green,
                                        nameButton: 'Aceptar'),
                                  )
                                ],
                              );
                            }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
