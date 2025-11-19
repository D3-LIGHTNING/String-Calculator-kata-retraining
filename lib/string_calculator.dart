import 'package:string_calculator_kata_retraining/number_parser.dart';

/// A ulitility class for calculating the sum of numbers found in a string
/// seperated by delimiters both default and custom.
class StringCalculator {
  final NumberParser _numberParser;

  const StringCalculator({required NumberParser numberParser})
    : _numberParser = numberParser;

  /// Calcuates the sum of numbers provided within the input string
  int calculate(String input) {
    if (input.isEmpty) return 0;

    int sum = 0;

    for (var number in _numberParser.parseInput(input)) {
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
