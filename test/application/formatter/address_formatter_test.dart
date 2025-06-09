import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/application/application.dart';

void main() {
  group('AddressFormatter', () {
    /// Initialize the default formatter for most tests
    late AddressFormatter formatter;

    setUp(() {
      formatter = AddressFormatter();
    });

    test('should accept valid address text', () {
      final validAddress = '123 Main St, Springfield, IL 62701';
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        TextEditingValue(text: validAddress),
      );
      // Add assertion to check the result
      expect(result.text, validAddress);
    });

    test('should reject invalid address text', () {
      const invalidCharacter = '@';
      final invalidAddress =
          '123 Main St, Springfield, IL 62701 $invalidCharacter';
      final oldValue = TextEditingValue(text: '123 Main St');
      final result = formatter.formatEditUpdate(
        oldValue,
        TextEditingValue(text: invalidAddress),
      );
      expect(result, oldValue);
    });

    test('should format with custom regex', () {
      const specialCharacter = '@';
      // Make sure the pattern string is properly escaped
      const customPattern = r'^[a-zA-Z0-9\s,@]+$';
      final customFormatter = AddressFormatter(customPattern: customPattern);
      final validAddress =
          '123 Main St, Springfield, IL 62701 $specialCharacter';
      final result = customFormatter.formatEditUpdate(
        TextEditingValue.empty,
        TextEditingValue(text: validAddress),
      );
      expect(result.text, validAddress);
    });

    test('should remove diacritics from text', () {
      final textWithDiacritics = 'Café Résumé Ñaño';
      final expectedText = 'Cafe Resume Nano';
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        TextEditingValue(text: textWithDiacritics),
      );
      expect(result.text, expectedText);
    });

    test('should preserve cursor position for valid input', () {
      final oldValue = TextEditingValue(
        text: 'Main',
        selection: TextSelection.collapsed(offset: 4),
      );
      final newValue = TextEditingValue(
        text: 'Main St',
        selection: TextSelection.collapsed(offset: 7),
      );
      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(result.selection, newValue.selection);
    });

    test('should handle empty string input', () {
      final oldValue = TextEditingValue(text: 'Some address');
      final newValue = TextEditingValue.empty;
      final result = formatter.formatEditUpdate(oldValue, newValue);
      expect(result.text, '');
    });

    test('should handle numeric-only input', () {
      final numericText = '123456';
      final result = formatter.formatEditUpdate(
        TextEditingValue.empty,
        TextEditingValue(text: numericText),
      );
      expect(result.text, numericText);
    });

    test('should handle special characters based on custom pattern', () {
      // Create a formatter that allows hyphens and periods
      final customFormatter =
          AddressFormatter(customPattern: r'^[a-zA-Z0-9\s\-\.]+$');

      // Test with hyphens and periods
      final addressWithSpecials = '123 Main St. Apt-4B';
      final result = customFormatter.formatEditUpdate(
        TextEditingValue.empty,
        TextEditingValue(text: addressWithSpecials),
      );

      expect(result.text, addressWithSpecials);
    });

    test('should reject partially valid text', () {
      // Text that starts valid but ends with invalid character
      final partiallyValid = '123 Main St #';
      final oldValue = TextEditingValue(text: '123 Main St');

      final result = formatter.formatEditUpdate(
        oldValue,
        TextEditingValue(text: partiallyValid),
      );

      // Should reject the entire new value
      expect(result, oldValue);
    });

    test('should preserve composing region for valid input', () {
      final composingRegion = TextRange(start: 4, end: 7);

      final oldValue = TextEditingValue(text: 'Main');
      final newValue = TextEditingValue(
        text: 'Main St',
        composing: composingRegion,
      );

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.composing, composingRegion);
    });
  });
}
