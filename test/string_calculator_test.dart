import 'package:string_calculator_kata_retraining/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator step 1 group", () {
    test("Returns 0 on empty string", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("");

      expect(expected, 0);
    });

    test("Returns 1 for a single number string", () {
      StringCalculator solution = StringCalculator();
      int expected = solution.add("1");

      expect(expected, 1);
    });
  });
}
