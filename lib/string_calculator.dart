class StringCalculator {
  int add(String numbers) {
    int sum = 0;

    if (numbers.isNotEmpty) {
      sum = int.parse(numbers);
    }

    return sum;
  }
}
