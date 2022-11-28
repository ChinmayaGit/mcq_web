import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mcq/Auth/SignUp.dart';
import 'package:mcq/components/colorSet.dart';
import 'package:mcq/components/global.dart';
import 'package:mcq/pages/HomePage.dart';
import 'package:mcq/widgets/customButton.dart';
import 'package:mcq/widgets/textForm.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  var jsonResponse;


  // Future<http.Response> logIn(String email, String password,context) async {
  //   final uri =
  //   Uri.parse(
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAhOphJEb4lppLOaeD8lopnnpknAlgR1Ds');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     // 'Authorization': 'Bearer token',
  //     'Accept': 'application/json',
  //   };
  //   Map<String, dynamic> body = {
  //     'email':email,
  //     'password': password,
  //     "returnSecureToken":true
  //   };
  //   String jsonBody = json.encode(body);
  //   final encoding = Encoding.getByName('utf-8');
  //
  //   http.Response response = await http.post(
  //     uri,
  //     headers: headers,
  //     body: jsonBody,
  //     encoding: encoding,
  //   );
  //   jsonResponse = json.decode(response.body);
  //   box.write("token", jsonResponse['refreshToken']);
  //   print(box.read("token"));
  //
  //   // if(box.read("token").toString()!="null") {
  //   //   Firestore.instance
  //   //       .collection('login')
  //   //       .get()
  //   //       .then((QuerySnapshot querySnapshot) {
  //   //     querySnapshot.docs.forEach((doc) {
  //   //       print(doc["first_name"]);
  //   //     });
  //   //   });
  //   //
  //   //  box.write("name",name);
  //   //   await Navigator.pushNamed(context, RouteNames.inbox);
  //   //
  //   // }else{
  //   //
  //   //   showDialog(
  //   //     context: context,
  //   //     builder: (BuildContext context) {
  //   //       // return object of type Dialog
  //   //       return AlertDialog(
  //   //         shape: RoundedRectangleBorder(
  //   //           borderRadius: BorderRadius.circular(20.0),
  //   //         ),
  //   //         title: new Text(
  //   //           "Location Share",
  //   //         ),
  //   //         actions: <Widget>[
  //   //
  //   //
  //   //           Padding(
  //   //             padding: const EdgeInsets.all(20.0),
  //   //             child: Text("Please check your id and password",style: TextStyle(fontSize: 25),),
  //   //           ),
  //   //           GestureDetector(
  //   //             onTap: () {
  //   //               Navigator.of(context).pop();
  //   //             },
  //   //             child: Container(
  //   //               child: new Text("Close"),
  //   //
  //   //             ),
  //   //           ),
  //   //
  //   //         ],
  //   //       );
  //   //     },
  //   //   );
  //   // }
  //   // oneTimeToken = jsonResponse['idToken'];
  //   return jsonResponse;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hName: "",
                      controllers: _idController,
                      hei: 70,
                      wid: Get.width / 5),
                  textF(
                      lName: 'Password',
                      hName: '',
                      controllers: _passwordController,
                      hei: 70,
                      wid: Get.width / 5),

                  GestureDetector(
                    onTap: () async{
                      // logIn(_idController.text,_passwordController.text,context);

                        try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: "${_idController.text}@gmail.com",
                            password: _passwordController.text,
                        ).then((value){
                          Get.to(() =>HomePage());
                          return value;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: cButton(
                      height: 40,
                      width: 100,
                      color: Colors.black,
                      text: "Go ",
                      fSize: 20,
                      cen: true,
                      fontW: FontWeight.bold,
                      fColor: Colors.white,
                      // cen: true,
                    ),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(const SignUp());
                      },
                      child:const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ))
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
