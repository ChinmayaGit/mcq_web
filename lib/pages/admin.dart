import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddQue extends StatelessWidget {
   AddQue({Key? key}) : super(key: key);
  TextEditingController acontrollers = TextEditingController();
   TextEditingController bcontrollers = TextEditingController();

   TextEditingController ccontrollers = TextEditingController();

   TextEditingController dcontrollers = TextEditingController();

   TextEditingController anscontrollers = TextEditingController();

   TextEditingController quecontrollers = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: false,
            controller: quecontrollers,
            validator: (value) {
              if (value!.isEmpty) return 'This field cannot be empty';
              return null;
            },
            // onSaved: (value) =>
            // _nameController = value.toString(),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "que",

              suffixIcon: Icon(Icons.ac_unit),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: false,
            controller: anscontrollers,
            validator: (value) {
              if (value!.isEmpty) return 'This field cannot be empty';
              return null;
            },
            // onSaved: (value) =>
            // _nameController = value.toString(),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "ans",

              suffixIcon: Icon(Icons.ac_unit),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: false,
            controller: acontrollers,
            validator: (value) {
              if (value!.isEmpty) return 'This field cannot be empty';
              return null;
            },
            // onSaved: (value) =>
            // _nameController = value.toString(),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "a",

              suffixIcon: Icon(Icons.ac_unit),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: false,
            controller: bcontrollers,
            validator: (value) {
              if (value!.isEmpty) return 'This field cannot be empty';
              return null;
            },
            // onSaved: (value) =>
            // _nameController = value.toString(),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "b",

              suffixIcon: Icon(Icons.ac_unit),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: false,
            controller: ccontrollers,
            validator: (value) {
              if (value!.isEmpty) return 'This field cannot be empty';
              return null;
            },
            // onSaved: (value) =>
            // _nameController = value.toString(),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "c",

              suffixIcon: Icon(Icons.ac_unit),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autofocus: false,
            controller: dcontrollers,
            validator: (value) {
              if (value!.isEmpty) return 'This field cannot be empty';
              return null;
            },
            // onSaved: (value) =>
            // _nameController = value.toString(),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "d",

              suffixIcon: Icon(Icons.ac_unit),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){

            FirebaseFirestore.instance.
                collection("question")
                .add({
              "a": acontrollers.text,
              "b": bcontrollers.text,
              "c": ccontrollers.text,
              "d": dcontrollers.text,
              "que": quecontrollers.text,
              "ans": anscontrollers.text,
            }).then((value) {
              acontrollers.clear();
              bcontrollers.clear();
              ccontrollers.clear();
              dcontrollers.clear();
              quecontrollers.clear();
              anscontrollers.clear();
            });
          },
          child: Container(
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),color: Colors.yellow
            ),
            height: 60,
            width: 160,
            child: Center(child: Text("add")),
          ),
        )
      ],),
    );
  }
}
