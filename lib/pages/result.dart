
import 'package:flutter/material.dart';

import '../compo_elements/button_widget.dart';
import '../const.dart';
import '../compo_elements/repeted_card.dart';



class ResultPage extends StatelessWidget {
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
                padding: EdgeInsets.all(35.0),
                alignment: Alignment.bottomLeft,
                child: const Text('RESULTAT', style: kTextCentreWidget),
              ),
            ),
            const Expanded(
              flex: 4,
              child: RepetedCard(
                kolor: kActivColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CORPULENCE',
                      style: kResultText,
                    ),
                    Text(
                      '18.3',
                      style: kCorpulence,
                    ),
                    Text(
                      'you should eat more',
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
