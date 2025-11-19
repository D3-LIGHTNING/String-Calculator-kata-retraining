abstract class DelimiterProvider {
  const DelimiterProvider();
  List<String> getDelimitersFromInput(String input);

  String transformInput(String input);
}

// Default delimiter provider to handle the default delimiters provided in the input
class DefaultDelimiterProvider extends DelimiterProvider {
  const DefaultDelimiterProvider();

  @override
  List<String> getDelimitersFromInput(String input) {
    return ["\n", ","];
  }

  @override
  String transformInput(String input) => input;
}

// Custom delimiter provider to handle custom seperaters provided in the input
class CustomDelimiterProvider extends DelimiterProvider {
  @override
  List<String> getDelimitersFromInput(String input) {
    List<String> delimiters = [];

    if (input.startsWith("//")) {
      delimiters.add(input.substring(2, input.indexOf("\n")));
    }

    return delimiters;
  }

  @override
  String transformInput(String input) {
    if (input.startsWith("//")) {
      return input.substring(input.indexOf("\n") + 1);
    }

    return input;
  }
}
