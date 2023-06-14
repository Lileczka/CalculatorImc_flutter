import 'package:flutter/material.dart';

class RepetedCard extends StatelessWidget {
  // son onstructor
  const RepetedCard(
      {required this.kolor, required this.cardChild, this.onPress, Key? key})
      : super(key: key);
  //propriete  color pour créer widget customisé
  final Color kolor;
  //creer un widget custom
  final Widget cardChild;
  //une propriete
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: kolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
