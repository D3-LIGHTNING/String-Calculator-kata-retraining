import 'package:string_calculator_kata_retraining/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator step 1 group", () {
    test("Returns 0 on empty string", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("");

      expect(expected, 0);
    });

    test("Returns the sum for a single number string", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("1");

      expect(expected, 1);
    });

    test("Returns the sum for a two digit number string", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("1,2");

      expect(expected, 3);
    });
  });

  group("String calculator step 2 group", () {
    test("Returns sum of any number of integers within the input", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("1,2,3");

      expect(expected, 6);
    });
  });

  group("String calculator step 3 group", () {
    test("Returns sum of numbers even those seperated by \n", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("1\n2,3");

      expect(expected, 6);
    });
  });
}
