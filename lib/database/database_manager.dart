import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mcq/components/global.dart';

class FireStoreDataBase {
  List studentsList = [];

  Future getData() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await collectionRef.doc("Eop4Vq7nGXe4Rg4M0Sa4").get();

      // to get data from all documents sequentially
      await collectionRefUser.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });

      return studentsList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  printDocID() async {
    var querySnapshots = await collectionRefUser.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      debugPrint(documentID);
    }
  }
}
