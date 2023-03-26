import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../screens/search_tracking.dart';
import '../widgets/Menu/menu_admin.dart';
import '../widgets/Menu/menu_admin_bottom.dart';
import '../widgets/Menu/menu_botton.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    if (User.role == "Admin") {
      return const AdminBottomBar();
    }

    if (User.role == "Transportista" || User.role == "User") {
      return const BottomBar();
    }
    return Container();
  }
}
