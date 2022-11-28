import 'package:flutter/cupertino.dart';

cButton(
    { double ?width,
      double ?height,
      required Color color,
      required String text,
      FontWeight ?fontW,
      required double fSize,
      Color ?fColor,
      bool ?cen,
    }) {

  return Center(
    child: Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: color,
      ),
      width:width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: cen==true?Center(child: Text(
          text,
          style: TextStyle(fontWeight: fontW, fontSize: fSize,color: fColor),
        ),):Text(
          text,
          style: TextStyle(fontWeight: fontW, fontSize: fSize,color: fColor),
        ),
      ),
    ),
  );
}

