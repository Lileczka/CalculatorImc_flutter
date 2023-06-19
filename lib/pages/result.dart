import 'package:flutter/material.dart';

import '../compo_elements/button_widget.dart';
import '../const.dart';
import '../compo_elements/repeted_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.corpulenceResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  //créer une proprieter pour passer data de la page home
  final String corpulenceResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULATOR', style: kLargeBottom),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(35.0),
                alignment: Alignment.bottomLeft,
                child: const Text('RESULTAT', style: kTextCentreWidget),
              ),
            ),
            Expanded(
              flex: 4,
              child: RepetedCard(
                kolor: kActivColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: kResultText,
                    ),
                    Text(
                      corpulenceResult,
                      style: kCorpulence,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomWidget(
                buttoTitle: 'Re-calculate',
                onTap: () {
                  Navigator.pop(context);
                }),
          ]),
    );
  }
}
