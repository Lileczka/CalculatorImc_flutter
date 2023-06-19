import 'package:flutter/material.dart';

import '../const.dart';



class CustomIconWidget extends StatelessWidget {
  //creer custom constructeur
  const CustomIconWidget({required this.iconData, required this.label, Key? key})
      : super(key: key);

  //creer proprieté
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
          color: const Color.fromARGB(255, 243, 233, 233),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
