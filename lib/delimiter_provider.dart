/// Base class for al the Delimiter providers used for seperating the input string.
abstract class Delimiter {
  const Delimiter();

  /// Returns a list of accepted delimiters used for seperating the input string.
  List<String> getDelimitersFromInput(String input);

  /// Transform the string to the desired shape before passing it to the next Delimiter.
  String transformInput(String input);
}

/// Default delimiter provider to handle the default delimiters provided in the input.
class DefaultDelimiter extends Delimiter {
  const DefaultDelimiter();

  @override
  List<String> getDelimitersFromInput(String input) {
    return ["\n", ","];
  }

  @override
  String transformInput(String input) => input;
}

/// Custom delimiter provider to handle custom seperaters provided in the input.
class CustomDelimiter extends Delimiter {
  @override
  List<String> getDelimitersFromInput(String input) {
    return _canHandleInput(input)
        ? [input.substring(2, input.indexOf("\n"))]
        : [];
  }

  @override
  String transformInput(String input) {
    return _canHandleInput(input)
        ? input.substring(input.indexOf("\n") + 1)
        : input;
  }

  bool _canHandleInput(String input) => input.startsWith("//");
}
