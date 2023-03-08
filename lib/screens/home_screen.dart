import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transhipper/dtos/responses/user_reponse_dto.dart';
import 'package:transhipper/screens/rastreo_screen.dart';
import 'package:transhipper/provider/user_provider.dart';
import 'package:transhipper/screens/user_details_screen.dart';
import 'package:transhipper/widgets/rastreo_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Envios = context.read<EnviosDto>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mis Envíos'),
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
              Consumer<UserProvider>(
                builder: (context, usersProvider, child) => usersProvider
                        .isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: usersProvider.users?.length,
                          itemBuilder: (context, index) {
                            final user = usersProvider.users![index];
                            return Card(
                              elevation: 10.0,
                              color: Colors.grey.shade200,
                              shadowColor: Colors.black,
                              child: Row(
                                children: <Widget>[
                                  const Card(
                                    child: SizedBox(
                                        width: 150,
                                        height: 150,
                                        child: Card(
                                          child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://plantasyflores.online/wp-content/uploads/2017/08/sunflower-1627193_1920-copia.jpg')),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      top: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Servicio: ${user.title}',
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Peso: ${user.weightContent}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 120,
                                            right: 5,
                                            top: 80,
                                            bottom: 0,
                                          ),
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Rastreo()));
                                                  },
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    backgroundColor:
                                                        MaterialStateProperty.all<
                                                            Color>(const Color
                                                                .fromARGB(
                                                            255, 180, 84, 132)),
                                                  ),
                                                  child: const Text("Ver")),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
    );
  }
}
