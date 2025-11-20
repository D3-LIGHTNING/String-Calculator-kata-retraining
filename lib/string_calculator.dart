import 'package:string_calculator_kata_retraining/number_parser.dart';

/// A ulitility class for calculating the sum of numbers found in a string
/// seperated by delimiters both default and custom.
class StringCalculator {
  final NumberParser _numberParser;
  int _callCount = 0;

  StringCalculator({required NumberParser numberParser})
    : _numberParser = numberParser;

  /// Calcuates the sum of numbers provided within the input string
  int calculate(String input) {
    _callCount++;

    if (input.isEmpty) return 0;

    int sum = 0;
    List<int> negativeNumbers = [];

    for (var number in _numberParser.parseInput(input)) {
      number < 0 ? negativeNumbers.add(number) : sum += number;
    }

    _assertNumberIsNonNegative(negativeNumbers);

    return sum;
  }

  // Returns the number of times the 'calculate' method has been called from within this instance.
  int getCalledCount() => _callCount;

  void _assertNumberIsNonNegative(List<int> negativeNumbers) {
    if (negativeNumbers.isNotEmpty) {
      throw Exception(
        "Negative numbers are not allowed ${negativeNumbers.join(",")}",
      );
    }
  }
}
