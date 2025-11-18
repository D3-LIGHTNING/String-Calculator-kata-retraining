class StringCalculator {
  int add(String numbers) {
    int sum = 0;

    if (numbers.isNotEmpty) {
      sum += int.parse(numbers[0]);

      if (numbers.length > 1) {
        sum += int.parse(numbers[2]);
      }
    }

    return sum;
  }
}
