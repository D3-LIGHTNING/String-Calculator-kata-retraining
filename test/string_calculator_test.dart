import 'package:string_calculator_kata_retraining/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator step 1 group", () {
    test("Returns 0 on empty string", () {
      StringCalculator solution = StringCalculator();
      int sum = solution.add("");

      expect(sum, 0);
    });
  });
}
