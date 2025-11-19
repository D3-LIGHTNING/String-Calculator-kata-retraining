import 'package:string_calculator_kata_retraining/delimiter_provider.dart';

/// Parses a string using the given list of [Delimiter]s.
/// For more info about [Delimiter]s, read it's documentation.
class NumberParser {
  final List<Delimiter> _delimiters;

  const NumberParser({required List<Delimiter> delimiters})
    : _delimiters = delimiters;

  /// Parses a string input using the given list of [Delimiter]s and return the numbers
  /// found within the string input as a list.
  List<int> parseInput(String input) {
    String transformedInput = input;
    List<String> delimters = [];

    for (Delimiter provider in _delimiters) {
      delimters.addAll(provider.getDelimitersFromInput(transformedInput));
      transformedInput = provider.transformInput(transformedInput);
    }

    RegExp regExp = RegExp(delimters.map(RegExp.escape).join("|"));

    List<String> numbers = transformedInput.split(regExp);
    List<int> integerNumbers = [];

    for (String number in numbers) {
      int? integerNumber = int.tryParse(number);

      if (integerNumber != null) {
        integerNumbers.add(integerNumber);
      }
    }

    return integerNumbers;
  }
}
