
import 'package:calcul_flutter/pages/result.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const CalculatorPage());
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
     initialRoute:'/',
     routes: {
      '/': (context)=> const HomePage(),
      '/second': (context)=> ResultPage(),
     }
    );
  }
}
