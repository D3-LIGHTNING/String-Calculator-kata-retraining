import 'package:string_calculator_kata_retraining/delimiter_provider.dart';

class NumberParser {
  final List<DelimiterProvider> delimiterProviders;

  const NumberParser(this.delimiterProviders);

  List<int> parseInput(String input) {
    String transformedInput = input;
    List<String> delimters = [];

    for (DelimiterProvider provider in delimiterProviders) {
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
