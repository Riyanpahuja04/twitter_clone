import 'package:flutter/material.dart';
import 'package:twitter_clone/services/auth/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _authService = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 8,
        title: const Text('Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (val) => setState(() {
                  email = val;
                }),
              ),
              TextFormField(
                onChanged: (val) => setState(() {
                  password = val;
                }),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _authService.signUpAction(emailAddress: email, password: password);
                },
                child: const Text('SignUp'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _authService.signInAction(emailAddress: email, password: password);
                },
                child: const Text('SignIn'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

