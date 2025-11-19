import 'package:string_calculator_kata_retraining/delimiter_provider.dart';

/// Parses a string using the given list of [DelimiterProvider]s.
/// For more info about [DelimiterProvider]s, read it's documentation.
class NumberParser {
  final List<DelimiterProvider> _providers;

  const NumberParser({required List<DelimiterProvider> providers})
    : _providers = providers;

  /// Parses a string input using the given list of [DelimiterProvider]s and return the numbers 
  /// found within the string input as a list.
  List<int> parseInput(String input) {
    String transformedInput = input;
    List<String> delimters = [];

    for (DelimiterProvider provider in _providers) {
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
