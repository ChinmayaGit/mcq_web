import 'package:flutter/material.dart';

textF(
    {Icon? icon,
      String ?lName,
      required String hName,
      required TextEditingController controllers,
      Icon? sIcon,
      required double hei,
      double? wid,

    }) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    width: wid,
    height: hei,
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: false,
        controller: controllers,
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
          icon: icon,
          hintText: hName,
          labelText: lName,
          suffixIcon: sIcon,
        ),
      ),
    ),
  );
}
