import 'package:flutter/material.dart';
import 'package:project_peace_app/helper/network/firebase_actions.dart';
import 'package:project_peace_app/helper/network/user_network_call.dart';

class FormInputUser extends StatefulWidget {
  const FormInputUser({Key? key}) : super(key: key);

  @override
  State<FormInputUser> createState() => _FormInputUserState();
}

class _FormInputUserState extends State<FormInputUser> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNetwork = UserNetwork();
  final firebaseAction = FirebaseActions();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
              controller: emailController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: const Text("Go Back")),
                ElevatedButton(
                    onPressed: () {
                      final form = _formState.currentState;
                      //  form validation failed stop execution
                      if (!(form != null && form.validate())) {
                        return;
                      }
                      final email = emailController.text;
                      final password = passwordController.text;

                      firebaseAction.createUserByEmailAndPassword(
                          email, password);
                    },
                    child: const Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
