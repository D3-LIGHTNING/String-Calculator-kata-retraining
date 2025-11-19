import 'package:string_calculator_kata_retraining/number_parser.dart';

class StringCalculator {
  final NumberParser numberParser;

  const StringCalculator({required this.numberParser});

  int calculate(String input) {
    if (input.isEmpty) return 0;

    int sum = 0;

    for (var number in numberParser.parseInput(input)) {
      _assertNumberIsNonNegative(number);
      sum += number;
    }

    return sum;
  }

  void _assertNumberIsNonNegative(int number) {
    if (number < 0) {
      throw Exception("Negative numbers are not allowed $number");
    }
  }
}
