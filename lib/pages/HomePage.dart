import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcq/pages/result.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? option0;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  String? option6;
  String? option7;
  String? option8;
  String? option9;
  int marks = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('question').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text((index + 1).toString() + " ) ",
                                        style:const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Container(
                                          child: Text(
                                        snapshot.data!.docs[index]["que"],
                                        style:const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                    ],
                                  ),
                                  const  SizedBox(
                                    height: 10,
                                  ),
                                  radioCustomButton(snapshot,index,"a"),
                                  radioCustomButton(snapshot,index,"b"),
                                  radioCustomButton(snapshot,index,"c"),
                                  radioCustomButton(snapshot,index,"d"),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
Get.to(     Result(mark: marks,));

                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 20, 40.0, 20),
                        child: Text("Finish"),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  radioCustomButton(snapshot,index,value){
    return RadioListTile(
        title:
        Text(snapshot.data!.docs[index][value]),
        value: snapshot.data!.docs[index][value],
        groupValue: index == 0
            ? option0
            : index == 1
            ? option1
            : index == 2
            ? option2
            : index == 3
            ? option3
            : index == 4
            ? option4
            : index == 5
            ? option5
            : index == 6
            ? option6
            : index == 7
            ? option7
            : index ==
            8
            ? option8
            : option9,
        onChanged: (value) {
          setState(() {
            index == 0
                ? option0 = value.toString()
                : index == 1
                ? option1 = value.toString()
                : index == 2
                ? option2 =
                value.toString()
                : index == 3
                ? option3 =
                value.toString()
                : index == 4
                ? option4 = value
                .toString()
                : index == 5
                ? option5 = value
                .toString()
                : index == 6
                ? option6 =
                value
                    .toString()
                : index ==
                7
                ? option7 =
                value.toString()
                : index == 8
                ? option8 = value.toString()
                : option9 = value.toString();
          });

          if (value.toString() ==
              snapshot.data!.docs[index]["ans"]) {
            marks++;
          }
        });
  }
}
