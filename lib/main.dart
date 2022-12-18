import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/models/user.dart';
import 'package:twitter_clone/services/auth/auth.dart';
import 'package:twitter_clone/services/wrapper.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Center(
                child: Text('Something went wrong'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<UserModel>.value(
              value: AuthService().user,
              initialData: UserModel(),
              child: const MaterialApp(
                home: Wrapper(),
              ),
            );
          }
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Center(
              child: Text('loading...'),
            ),
          );
        });
  }
}
