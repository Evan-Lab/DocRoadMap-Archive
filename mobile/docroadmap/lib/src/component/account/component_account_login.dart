
import 'package:app/src/providers/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: "test.test@test.com");
  final passwordController = TextEditingController(text: "test");

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userInfo = context.watch<UserProvider>().userInfo;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          ((userInfo != null) ? Text(userInfo.firstName) : const Text("Login")),
          Container(
            margin: const EdgeInsets.only(bottom: 30, top: 30),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email ',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "The Email field is mandatory";
                }
                return null;
              },
              controller: emailController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "The Password field is mandatory";
                }
                return null;
              },
              controller: passwordController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(side: BorderSide.none),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // ignore: unused_local_variable
                  var emailVal = emailController.text;
                  // ignore: unused_local_variable
                  var passwordVal = passwordController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Sending, please wait...")),
                  );
                  FocusScope.of(context).requestFocus(FocusNode());

    
                }
              },
              child: const Text("Send"),
            ),
          )
        ],
      ),
    );
  }
}
