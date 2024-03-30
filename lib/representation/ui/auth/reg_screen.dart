

import 'package:flutter/material.dart';
import 'package:cotton_app/data/services/auth/auth_services.dart';
import 'package:cotton_app/representation/widget/my_button.dart';
import 'package:cotton_app/representation/widget/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  //
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
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
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      //   logo
                      Icon(
                        Icons.lock,
                        size: 100,
                      ),
                      const SizedBox(height: 20),

                      // welcome back, you've been missed!
                      Text(
                        'Let\'s create Account for you',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 25),

                      MyTextField(
                          controller: _nameController,
                          obscureText: false,
                          title: 'Name',
                          icon: Icons.person),


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
                        text: 'Sign Up',
                        color: Color.fromARGB(255, 29, 201, 192),
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                           signUpUser();
                          }
                        },
                      ),

                      const SizedBox(height: 25),

                      //   Not an member
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Login Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
