
import 'package:app/src/component/account/component_account_sign_up.dart';
import 'package:flutter/material.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          actions: const [],
        ),
        backgroundColor: const Color(0Xfffbfbfb),
        body: Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: ListView(
              children: [
                SignUpForm(),
              ],
            )));
  }
}