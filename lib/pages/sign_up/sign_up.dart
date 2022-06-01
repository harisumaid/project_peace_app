import 'package:flutter/material.dart';
import 'package:project_peace_app/component/input_element.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: const FormInputUser()
    );
  }
}
