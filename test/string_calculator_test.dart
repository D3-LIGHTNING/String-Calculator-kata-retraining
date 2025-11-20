import 'package:string_calculator_kata_retraining/delimiter_provider.dart';
import 'package:string_calculator_kata_retraining/number_parser.dart';
import 'package:string_calculator_kata_retraining/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String calculator step 1 group", () {
    test("Returns 0 on empty string", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
      );
      int expected = solution.calculate("");

      expect(expected, 0);
    });

    test("Returns the sum for a single number string", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
      );
      int expected = solution.calculate("1");

      expect(expected, 1);
    });

    test("Returns the sum for a two digit number string", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
      );
      int expected = solution.calculate("1,2");

      expect(expected, 3);
    });
  });

  group("String calculator step 2 group", () {
    test("Returns sum of any number of integers within the input", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
      );
      int expected = solution.calculate("1,2,3");

      expect(expected, 6);
    });
  });

  group("String calculator step 3 group", () {
    test("Returns sum of numbers even those seperated by \n", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
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
          numberParser: NumberParser(
            delimiters: [DefaultDelimiter(), CustomDelimiter()],
          ),
        );

        int expected = solution.calculate("//;\n1;2;3");

        expect(expected, 6);
      },
    );
  });

  group("String calculator step 5", () {
    test("Throws an excpetion if negative numbers are encountered", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
      );

      expect(() => solution.calculate("1,2,-3"), throwsException);
    });
  });

  group("String calculator step 6", () {
    test(
      "Throws an exception if negative numbers of "
      "multiple count is found with all of them in the exception message",
      () {
        StringCalculator solution = StringCalculator(
          numberParser: NumberParser(delimiters: [DefaultDelimiter()]),
        );

        Object? exception;

        try {
          solution.calculate("1,2,-3,-4,-5");
        } catch (error) {
          exception = error;
        }

        expect((exception?.toString().contains("-3,-4,-5")) ?? false, true);
      },
    );
  });

  group("String calculator step 7", () {
    test(
      "returns the calculate method called count upon calling getCalledCount",
      () {
        StringCalculator solution = StringCalculator(
          numberParser: NumberParser(
            delimiters: [DefaultDelimiter(), CustomDelimiter()],
          ),
        );

        solution.calculate("1,2,3");

        solution.calculate("1,2,5,10");

        int calledCount = solution.getCalledCount();

        expect(calledCount, 2);
      },
    );
  });

  group("String calculator step 8", () {
    test("ignores number greater than 1000", () {
      StringCalculator solution = StringCalculator(
        numberParser: NumberParser(
          delimiters: [DefaultDelimiter(), CustomDelimiter()],
        ),
      );

      int expected = solution.calculate("1,1001,3,2500");

      expect(expected, 4);
    });
  });
}
