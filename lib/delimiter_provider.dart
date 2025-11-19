abstract class DelimiterProvider {
  const DelimiterProvider();
  List<String> getDelimitersFromInput(String input);
}

class DefaultDelimiterProvider extends DelimiterProvider {
  const DefaultDelimiterProvider();

  @override
  List<String> getDelimitersFromInput(String input) {
    return ["\n", ","];
  }
}