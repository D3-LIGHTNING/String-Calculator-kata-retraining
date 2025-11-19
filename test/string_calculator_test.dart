import 'package:string_calculator_kata_retraining/delimiter_provider.dart';
import 'package:string_calculator_kata_retraining/number_parser.dart';
import 'package:string_calculator_kata_retraining/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator step 1 group", () {
    test("Returns 0 on empty string", () {
      StringCalculator solution = StringCalculator(
        NumberParser([DefaultDelimiterProvider()]),
      );
      int expected = solution.calculate("");

      expect(expected, 0);
    });

    test("Returns the sum for a single number string", () {
      StringCalculator solution = StringCalculator(
        NumberParser([DefaultDelimiterProvider()]),
      );
      int expected = solution.calculate("1");

      expect(expected, 1);
    });

    test("Returns the sum for a two digit number string", () {
      StringCalculator solution = StringCalculator(
        NumberParser([DefaultDelimiterProvider()]),
      );
      int expected = solution.calculate("1,2");

      expect(expected, 3);
    });
  });

  group("String calculator step 2 group", () {
    test("Returns sum of any number of integers within the input", () {
      StringCalculator solution = StringCalculator(
        NumberParser([DefaultDelimiterProvider()]),
      );
      int expected = solution.calculate("1,2,3");

      expect(expected, 6);
    });
  });

  group("String calculator step 3 group", () {
    test("Returns sum of numbers even those seperated by \n", () {
      StringCalculator solution = StringCalculator(
        NumberParser([DefaultDelimiterProvider()]),
      );
      int expected = solution.calculate("1\n2,3");

      expect(expected, 6);
    });
  });

  group("String calculator step 4 group", () {
    test(
      "Returns sum of numbers even those seperated by custom separators",
      () {
        StringCalculator solution = StringCalculator(
          NumberParser([DefaultDelimiterProvider()]),
        );

        int expected = solution.calculate("//;\n1;2;3");

        expect(expected, 6);
      },
    );
  });
}
