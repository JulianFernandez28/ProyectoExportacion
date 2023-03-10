import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transhipper/provider/rastreo_provider.dart';
import 'package:transhipper/widgets/create_buttons.dart';

import '../widgets/rastreo_screen.dart';

class Rastreo extends StatelessWidget {
  const Rastreo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rastreo'),
        backgroundColor: const Color.fromRGBO(35, 46, 141, 25),
        leading: const BackButton(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(231, 96, 106, 205),
          child: Card(
            elevation: 10.0,
            color: Colors.grey.shade200,
            shadowColor: Colors.black,
            child: Column(
              children: <Widget>[
                const FlowerTurn(),
                Consumer<RastreoProvider>(
                  builder: (context, rastreoProvider, child) =>
                      rastreoProvider.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Expanded(
                              child: ListView.builder(
                                itemCount: rastreoProvider.users?.length,
                                itemBuilder: (context, index) {
                                  final user = rastreoProvider.users![index];
                                  return Container(
                                    color: Colors.grey.shade300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, right: 8),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  color: Colors.black12,
                                                  child: Card(
                                                    color: Colors.grey.shade200,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Row(
                                                          children: [
                                                            Card(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  84,
                                                                  132),
                                                              child: SizedBox(
                                                                width: 70,
                                                                height: 70,
                                                                child: Card(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200,
                                                                  child: Column(
                                                                    children: const [
                                                                      SizedBox(
                                                                        height:
                                                                            60,
                                                                        child: Icon(
                                                                            Icons
                                                                                .brightness_1_sharp,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                180,
                                                                                84,
                                                                                132)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 279,
                                                          height: 83,
                                                          child: Card(
                                                            color: Colors
                                                                .grey.shade200,
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  '${user.description} \n',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                                Text(
                                                                  '${user.actualLocation}',
                                                                  style: const TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          19,
                                                                          38,
                                                                          145),
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SizedBox(
                      width: 120,
                      height: 90,
                      child: CreateButton(
                          backfondo: Colors.green, nameButton: 'Aceptar'),
                    ),
                    SizedBox(
                      width: 123,
                      height: 90,
                      child: CreateButton(
                          backfondo: Colors.purple, nameButton: 'Actualizar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
