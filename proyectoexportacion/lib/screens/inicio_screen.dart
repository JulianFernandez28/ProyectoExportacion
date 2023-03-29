import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUser(User.curp);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: ScrollNotificationObserver(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const SizedBox(height: 16.0),
                  CircleAvatar(
                    radius: 150.0,
                    backgroundImage: const AssetImage('images/logo.png'),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    '¡Bienvenido a nuestra aplicación!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ));
  }
}
