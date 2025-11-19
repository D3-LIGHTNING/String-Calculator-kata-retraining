import 'package:string_calculator_kata_retraining/number_parser.dart';

class StringCalculator {
  final NumberParser numberParser;

  const StringCalculator(this.numberParser);

  int calculate(String input) {
    if (input.isEmpty) return 0;

    int sum = 0;

    for (var element in numberParser.parseInput(input)) {
      sum += element;
    }

    return sum;
  }
}