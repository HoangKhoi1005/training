part of application;

/// A custom text input formatter for validating and formatting address inputs.
///
/// This formatter provides functionality to:
/// * Remove diacritics from entered text (accents and special character marks)
/// * Validate input against a configurable regular expression pattern
/// * Maintain the previous valid value when invalid input is detected
///
/// Useful for form fields where you need to ensure address text follows
/// specific formatting rules or character constraints.
///
/// Example usage:
/// ```dart
/// final addressField = TextField(
///   inputFormatters: [AddressFormatter()],
///   decoration: InputDecoration(
///     labelText: 'Address',
///     hintText: 'Enter a valid address',
///   ),
/// );
/// ```
class AddressFormatter extends TextInputFormatter {
  /// The regular expression used to validate input text.
  ///
  /// This pattern determines which characters are accepted in the formatted address.
  /// The default pattern accepts alphanumeric characters, spaces, and commas.
  final RegExp regExp;

  /// Creates an [AddressFormatter] with optional custom validation pattern.
  ///
  /// * [customPattern] - Optional regular expression pattern string to override the default
  ///   pattern. If not provided, defaults to `r'^[a-zA-Z0-9\s,]+$'` which allows
  ///   alphanumeric characters, spaces, and commas.
  /// * [separator] - Space character used for formatting (reserved for future use).
  ///
  /// Example with custom pattern that also allows symbols:
  /// ```dart
  /// final formatter = AddressFormatter(customPattern: r'^[a-zA-Z0-9\s,\-\.]+$');
  /// ```
  AddressFormatter({String? customPattern, String separator = ' '})
      : regExp = RegExp(customPattern ?? r'^[a-zA-Z0-9\s,]+$');

  /// Formats and validates text input changes.
  ///
  /// This method is called automatically by Flutter when text changes in a TextField
  /// that has this formatter in its `inputFormatters` list.
  ///
  /// The method performs these operations:
  /// 1. Removes diacritics from the new input value
  /// 2. Validates the normalized text against the configured regex pattern
  /// 3. Returns either the old value (if invalid) or the normalized new value (if valid)
  ///
  /// * [oldValue] - The previous value in the text field before the current change
  /// * [newValue] - The new value with the user's latest input
  ///
  /// Returns a [TextEditingValue] containing either:
  /// * The normalized new value (if valid)
  /// * The old value (if the new input is invalid)
  ///
  /// Example:
  /// ```dart
  /// // With default formatter (alphanumeric + spaces only)
  /// final formatter = AddressFormatter();
  ///
  /// // This passes validation
  /// final result1 = formatter.formatEditUpdate(
  ///   TextEditingValue(text: "123 Main"),
  ///   TextEditingValue(text: "123 Main St")
  /// );
  /// print(result1.text); // "123 Main St"
  ///
  /// // This fails validation due to @ character
  /// final result2 = formatter.formatEditUpdate(
  ///   TextEditingValue(text: "123 Main"),
  ///   TextEditingValue(text: "123 Main @")
  /// );
  /// print(result2.text); // "123 Main" (keeps old value)
  /// ```
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value is empty, return new value as is
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove diacritics from the new value
    final normalizedText = removeDiacritics(newValue.text);

    // Validate the new input against the regex
    if (!regExp.hasMatch(normalizedText)) {
      // If the input is invalid, return the old value
      return oldValue;
    }

    // If the input is valid, accept the new value as result
    return newValue;
  }
}
