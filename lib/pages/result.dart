import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    required this.mark,
    Key? key,
  }) : super(key: key);
  final int mark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 60,
              width: 100,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),color: Colors.green
              ),

              child: Center(child: Text("Mark Obtained:")),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              child: Text(mark.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
