
import 'dart:math';

class CalculFunc {
  CalculFunc({required this.height, required this.weight});

  final int height;
  final int weight;

  late double _corpulance;

  String calculateCorp() {
    double corpulance = weight / pow(height / 100, 2);
    //pour une chiffre apres virgule
    return corpulance.toStringAsFixed(1);
  }

  String getResult() {
    if (_corpulance >= 25) {
      return 'Overweight';
    } else if (_corpulance > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_corpulance >= 25) {
      return "1. Fixez des objectifs réalistes: définissez des objectifs réalisables à court terme et à long terme pour vous motiver.\nAdoptez une alimentation équilibrée : privilégiez les aliments frais, riches en nutriments, et réduisez les aliments transformés et les sucres ajoutés.\n2. Faites de l'exercice régulièrement : choisissez des activités physiques qui vous plaisent et essayez de les pratiquer régulièrement.\n3.Trouvez un soutien : rejoignez des groupes de soutien en ligne ou dans votre communauté pour partager votre parcours et obtenir des conseils supplémentaires.\n4. Soyez bienveillant envers vous-même : rappelez-vous que chaque petit progrès compte et appréciez les efforts que vous faites pour prendre soin de vous.";
    } else if (_corpulance > 18.5) {
      return "1.Adoptez une alimentation équilibrée: privilégiez les aliments frais, riches en nutriments, et veillez à inclure une variété de fruits, de légumes, de protéines maigres et de grains entiers dans votre alimentation.\n2. Faites de l'exercice régulièrement : choisissez des activités physiques qui vous plaisent et essayez de les intégrer régulièrement dans votre emploi du temps. L'activité physique régulière aide à maintenir un poids santé et à renforcer votre santé globale.";
    } else {
      return "1. Optez pour des collations nutritives : ajoutez des collations saines entre les repas pour augmenter votre apport calorique global. Des options telles que les noix, les graines, les fruits secs, les yaourts ou les smoothies peuvent vous aider à obtenir des nutriments supplémentaires.\n2. Prenez soin de votre bien-être mental : la maigreur peut parfois être associée à des problèmes de confiance en soi ou à des troubles de l'alimentation. Assurez-vous de vous entourer de soutien, qu'il s'agisse d'amis, de membres de votre famille ou de professionnels de la santé mentale.";
    }
  }
}
