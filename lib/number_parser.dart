import 'package:string_calculator_kata_retraining/delimiter_provider.dart';

class NumberParser {
  final List<DelimiterProvider> delimiterProviders;

  const NumberParser(this.delimiterProviders);

  List<int> parseInput(String input) {
    if (delimiterProviders.isEmpty) {
      throw Exception("No delimiter providers where found");
    }

    List<String> delimters = [];

    for (DelimiterProvider provider in delimiterProviders) {
      delimters.addAll(provider.getDelimitersFromInput(input));
    }

    RegExp regExp = RegExp(delimters.map(RegExp.escape).join("|"));

    return input.split(regExp).map((e) => int.parse(e)).toList();
  }
}