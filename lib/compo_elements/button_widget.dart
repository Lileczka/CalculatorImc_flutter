import 'package:flutter/material.dart';

import '../const.dart';



class BottomWidget extends StatelessWidget {
 const  BottomWidget({
   Key? key, 
   required this.onTap, 
   required this.buttoTitle}): super(key: key);

  final VoidCallback onTap;
  final String buttoTitle;

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Center(
        child: Text(
          buttoTitle,
          style: kLargeBottom,
          ),
        ),
        color: kBottomColor,
        height: kBottomHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
