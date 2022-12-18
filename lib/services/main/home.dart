import 'package:flutter/material.dart';
import 'package:twitter_clone/services/auth/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
              onPressed: () async {
                authService.signOut();
              },
              child: Row(
                children: const [
                  Icon(Icons.logout),
                  Text("Sign out"),
                ],
              ))
        ],
      ),
    );
  }
}
