import 'package:flutter/material.dart';

import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:proyectoexportacion/dtos/responses/userdata_response_dto.dart';
import 'package:proyectoexportacion/providers/user_provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../widgets/account/form_update.dart';
import '../widgets/account/infor_user.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUser(User.curp);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<UserProvider>(context, listen: false).getUser(User.curp);
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await Restart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    final userd = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mi perfil'),
        backgroundColor: const Color.fromARGB(231, 15, 28, 141),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.account_circle,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Informacion",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 121, 121, 121)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 3,
                  thickness: 3,
                ),
                Card(
                  child: Consumer<UserProvider>(
                    builder: (context, userProvider, child) => userProvider
                            .isloading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                final user = userProvider.user;

                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoUser(
                                        dato: user!.curp,
                                        tipo: "Curp",
                                      ),
                                      const SizedBox(height: 16),
                                      InfoUser(
                                        dato: user.name,
                                        tipo: "Nombre",
                                      ),
                                      const SizedBox(height: 8),
                                      InfoUser(
                                        dato: user.lastName,
                                        tipo: "Apellidos",
                                      ),
                                      const SizedBox(height: 16),
                                      InfoUser(
                                        dato: user.emailAddres,
                                        tipo: "Correo electronico",
                                      ),
                                      const SizedBox(height: 16),
                                      InfoUser(
                                        dato: user.numberPhone,
                                        tipo: "Numero de telefono",
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => logOut(),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(30, 40),
                            backgroundColor:
                                const Color.fromARGB(255, 230, 16, 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text("Cerrar sesion"),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 40),
                              backgroundColor:
                                  const Color.fromARGB(255, 65, 33, 243),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () async {
                            await _onBackPress(userd!);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Center(
                                child: Text(
                                  'Editar',
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPress(UserResponseDto userd) async {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final numberController = TextEditingController();

    final logger = Logger();

    return await Navigator.push(
          context,
          FormUpdate(formKey, userd, nameController, lastNameController,
              numberController),
        ) ??
        false;
  }
}
