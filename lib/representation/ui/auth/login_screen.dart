import 'package:flutter/material.dart';
import 'package:cotton_app/data/services/auth/auth_services.dart';
import 'package:cotton_app/representation/widget/my_button.dart';
import 'package:cotton_app/representation/widget/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;

  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  //
  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _signInFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

                    // logo
                    Icon(
                      Icons.lock,
                      size: 100,

                    ),

                    const SizedBox(height: 20),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // username textfield

                    MyTextField(
                        controller: _emailController,
                        obscureText: false,
                        title: 'Email',
                        icon: Icons.mail),

                    MyTextField(
                        controller: _passwordController,
                        obscureText: true,
                        title: 'Password',
                        icon: Icons.key),
                    const SizedBox(height: 25),
                    CustomButton(
                      text: 'Sign In',
                      color:  Color.fromARGB(255, 29, 201, 192),
                      onTap: () {
                        if (_signInFormKey.currentState!.validate()) {
                           signInUser();
                        }
                      },
                    ),

                    SizedBox(height: 20,),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}