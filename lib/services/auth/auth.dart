import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter_clone/models/user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<UserModel> get user{
    return auth.authStateChanges().map(_userFromFireBase);
  }

  Future<void> signUpAction({required String emailAddress, required String password}) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ) as User;
      _userFromFireBase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint('error $e');
    }
  }

  Future<void> signInAction({required String emailAddress, required String password}) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      ) as User;

      _userFromFireBase(user);
    } on FirebaseAuthException catch (e) {
      debugPrint('$e');
    } catch (e) {
      debugPrint('error $e');
    }
  }

  UserModel _userFromFireBase(User? user){
    return user != null ? UserModel(id: user.uid) : UserModel();
  }
}