
import 'package:flutter/material.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

 
  String genderGuid = '';
  String countryCode = '';
  
  List<DropdownMenuItem> lstGenders = [];
  List<DropdownMenuItem> lstCountries = [];

  List<DropdownMenuItem> getGenderItems() {
    List<DropdownMenuItem> lst = [];

    lst.add(getDrpDnItem("male", "Male"));
    lst.add(getDrpDnItem("female", "Female"));

    genderGuid = lst[0].value;

    return lst;
  }


  DropdownMenuItem getDrpDnItem(String guid, String label) {
    return DropdownMenuItem(
      value: guid,
      child: Text(label),
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }


  @override
  Widget build(BuildContext context) {

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 30, top: 30),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The FirstName field is mandatory";
                      }
                      return null;
                    },
                    controller: firstNameController,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The LastName field is mandatory";
                      }
                      return null;
                    },
                    controller: lastNameController,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: DropdownButtonFormField(
                    value: genderGuid,
                    items: lstGenders,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        genderGuid = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 30, top: 30),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The EmailAddress field is mandatory";
                      }
                      return null;
                    },
                    controller: emailController,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
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
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The Confirm Password field is mandatory";
                      } else if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                  ),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 30),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(side: BorderSide.none),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var firstNameVal = firstNameController.text;
                        var lastNameVal = lastNameController.text;
                        var emailVal = emailController.text;
                        var passwordVal = passwordController.text;
                        var genderVal = genderGuid;
                        var countryCodeVal = countryCode;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Sending, please wait...")),
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




