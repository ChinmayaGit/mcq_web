
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mcq/components/colorSet.dart';
import 'package:mcq/components/global.dart';
import 'package:mcq/pages/HomePage.dart';
import 'package:mcq/widgets/customButton.dart';
import 'package:mcq/widgets/textForm.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Future<User?> registerWithEmailPassword(String email, String password) async {
  //   // Initialize Firebase
  //   await Firebase.initializeApp();
  //   User? user;
  //
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //
  //     user = userCredential.user;
  //
  //     if (user != null) {
  //       uid = user.uid;
  //       userEmail = user.email;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //
  //   return user;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUp"),centerTitle: true,),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            child: Card(
              elevation: 10,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Lottie.asset('assets/welcome.json'),
                  ),
                  textF(
                      lName: 'UserName',
                      hName: 'Create your UserName',
                      controllers: _idController,
                      hei: 40,
                      wid: Get.width / 6),
                  textF(
                      lName: 'Password',
                      hName: 'Create your Password',
                      controllers: _passwordController,
                      hei: 40,
                      wid: Get.width / 6),
                 GestureDetector(
                      onTap: () async{
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: "${_idController.text}@gmail.com",
                              password: _passwordController.text,
                          ).then((value){
                            collectionRefUser
                                .add({
                              'Name': "TestName",
                            });
                            Get.to(() =>HomePage());
                            return value;
                          });
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            Fluttertoast.showToast(
                                msg: "The UserName already taken.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_LEFT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child:  Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: cButton(
                        height: 40,

                        color: Colors.black,
                        text: "Create Account",
                        fSize: 20,
                        cen: true,
                        fontW: FontWeight.bold,
                        fColor: Colors.white,
                        // cen: true,
                      ),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  // GestureDetector(
                  //     onTap: (){
                  //
                  //     },
                  //     child: Text("Create Account",style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,),))
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
