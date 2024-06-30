
import 'package:app/src/component/account/component_account_login.dart';
import 'package:flutter/material.dart';

class PageAccountLogin extends StatefulWidget {
  const PageAccountLogin({super.key});

  @override
  State<PageAccountLogin> createState() => _PageAccountLoginState();
}

class _PageAccountLoginState extends State<PageAccountLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login page'),
          actions: const [],
        ),
        backgroundColor: const Color(0Xfffbfbfb),
        body: Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: ListView(
              children: [
                LoginForm(),
              ],
            )));
  }
}