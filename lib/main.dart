import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcq/Auth/login.dart';
import 'package:mcq/pages/HomePage.dart';
import 'package:mcq/pages/admin.dart';
import 'package:mcq/widgets/textForm.dart';
import 'package:lottie/lottie.dart';
import 'widgets/customButton.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyAhOphJEb4lppLOaeD8lopnnpknAlgR1Ds",
      appId: "1:272037889299:web:745e38c3693b1c290386e6",
      messagingSenderId: "272037889299",
      projectId: "mcq-37d7e",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: AuthCheck(),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userLogin = false;

  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance.idTokenChanges().listen((User? user) {
  //     if (user == null) {
  //       print(user);
  //       print("chinuX");
  //       userLogin = false;
  //     } else {
  //       print(user);
  //       print("chinu");
  //       userLogin = true;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

