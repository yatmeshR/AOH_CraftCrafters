import 'package:cotton_app/representation/ui/auth/login_screen.dart';
import 'package:cotton_app/representation/ui/auth/reg_screen.dart';
import 'package:flutter/material.dart';


class LoginOrReg extends StatefulWidget {
  static const String routeName = '/login-or-reg';
  const LoginOrReg({super.key});

  @override
  State<LoginOrReg> createState() => _LoginOrRegState();
}

class _LoginOrRegState extends State<LoginOrReg> {
// initial show login page
  bool showLoginPage = true;

// Toggle method
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        onTap: togglePages,
      );
    } else {
      return RegisterScreen(
        onTap: togglePages,
      );
    }
  }
}
