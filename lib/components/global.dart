import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

final googleClientId = 'AIzaSyAhOphJEb4lppLOaeD8lopnnpknAlgR1Ds.apps.googleusercontent.com';
final callbackUrlScheme = 'com.googleusercontent.apps.XXXXXXXXXXXX-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';

const apiKey = 'AIzaSyAhOphJEb4lppLOaeD8lopnnpknAlgR1Ds';
const projectId = 'mcq-37d7e';

final box = GetStorage();

final CollectionReference collectionRefUser =
FirebaseFirestore.instance.collection("Students");

// final FirebaseUser _auth = FirebaseAuth.instance;

String? uid;
String? userEmail;

