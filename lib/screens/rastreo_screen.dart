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
        child: Card(
          elevation: 10.0,
          color: Colors.grey.shade200,
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              Consumer<RastreoProvider>(
                builder: (context, rastreoProvider, child) => rastreoProvider
                        .isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: rastreoProvider.users?.length,
                          itemBuilder: (context, index) {
                            final user = rastreoProvider.users![index];
                            return Column(
                              children: [
                                const FlowerTurn(),
                                Center(
                                  child: Row(
                                    children: [
                                      Card(
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Card(
                                                  child: SizedBox(
                                                    width: 70,
                                                    height: 70,
                                                    child: Card(
                                                      color:
                                                          Colors.grey.shade200,
                                                      child: Column(
                                                        children: const [
                                                          Text(
                                                            'Enero',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            '14',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 298,
                                              height: 83,
                                              child: Card(
                                                color: Colors.grey.shade200,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${user.title}   \n ',
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      ' ${user.sourceLocation}',
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 19, 38, 145),
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                              ],
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
    );
  }
}
