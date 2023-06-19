import 'package:calcul_flutter/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../compo_elements/button_round.dart';
import '../compo_elements/icone_content.dart';
import '../const.dart';
import '../compo_elements/repeted_card.dart';
import '../service/calcul_func.dart';

//créer enum
enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  // 1ere version:

  //Color maleCardColor = inactiveColor;
  //Color femaleCardColor = inactiveColor;

//1 = male
  /* void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      //plus court:
      maleCardColor ? activColor : inactiveColor;

      if (maleCardColor == inactiveColor) {
        maleCardColor = activColor;
        femaleCardColor = inactiveColor;
      } else {
        maleCardColor = inactiveColor;
      }
    } else if (selectedGender == Gender.female) {
      if (femaleCardColor == inactiveColor) {
        femaleCardColor = activColor;
        maleCardColor = inactiveColor;
      } else {
        femaleCardColor = inactiveColor;
      }
    }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        centerTitle: true,
        // backgroundColor: Color.fromARGB(255, 29, 172, 48),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RepetedCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      kolor: selectedGender == Gender.male
                          ? kActivColor
                          : kInactiveColor,
                      cardChild: const CustomIconWidget(
                        iconData: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: RepetedCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      kolor: selectedGender == Gender.female
                          ? kActivColor
                          : kInactiveColor,
                      cardChild: const CustomIconWidget(
                        iconData: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RepetedCard(
                kolor: kActivColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kTextCentreWidget,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.orange,
                      inactiveColor: kInactiveColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RepetedCard(
                      kolor: kActivColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kTextCentreWidget,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RepetedCard(
                      kolor: kActivColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kTextCentreWidget,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomWidget(
                buttoTitle: 'CALCULATE',
                onTap: () {
                  //initier un nouveau objet 
                  CalculFunc myCalculator =  CalculFunc(height:height,weight:weight);
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    ResultPage (
                    corpulenceResult:  myCalculator.calculateCorp(),
                    resultText:  myCalculator.getResult(),
                    interpretation: myCalculator.getInterpretation(),)),
                  );
                }),
          ]),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
      Key? key, 
    required this.onTap, 
    required this.buttoTitle})
    : super(key: key);

  final VoidCallback? onTap;
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
