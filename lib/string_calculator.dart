class StringCalculator {
  int add(String input) {
    if (input.isEmpty) return 0;

    int sum = 0;
    List<String> numbers = input.split(RegExp('[, \n]'));

    for (String number in numbers) {
      sum += int.parse(number);
    }

    return sum;
  }
}