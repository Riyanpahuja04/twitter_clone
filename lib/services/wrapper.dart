import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/models/user.dart';
import 'package:twitter_clone/screens/auth/signup.dart';
import 'package:twitter_clone/services/main/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if(user.id == null){
      //show auth system routes
      return const SignUp();
    }
    //show main system routes
    return const Home();

  }
}
