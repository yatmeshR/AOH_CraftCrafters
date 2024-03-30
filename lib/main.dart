import 'package:cotton_app/data/services/auth/auth_services.dart';
import 'package:cotton_app/provider/user_provider.dart';
import 'package:cotton_app/representation/ui/auth/log_or_reg.dart';
import 'package:cotton_app/representation/widget/bottombar.dart';
import 'package:cotton_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constant/global_variable.dart';
import 'representation/ui/admin/ui/admin_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home:Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const BottomBar()
          : const AdminScreen()
          : const LoginOrReg(),
    );
  }
}
