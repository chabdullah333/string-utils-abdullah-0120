import 'package:dartx/dartx_io.dart';
import 'package:email_validator/email_validator.dart';

class StringHelperUtils {
  StringHelperUtils._();
  static final instance = StringHelperUtils._();

  ///To check if the text field entering amount values is valid or not
  ///[amountValue] is required
  ///[baseCurrencyString] is optional(can be useful in future) but if not null or empty, will be replaced with voids
  ///then check if the rest amount is numeric or not
  bool isValidAmountValue({required String amountValue, required double allowedMaxAmount, String baseCurrencyString = ""}) {
    bool isValid = false;
    if (amountValue.isNotEmpty) {
      String amountToCheck = getAmountValueWithoutCurrency(givenAmount: amountValue);
      if (isNumeric(stringValue: amountToCheck) && double.tryParse(amountToCheck) != null) {
        double amount = double.tryParse(amountToCheck)!;
        if (amount <= allowedMaxAmount) {
          isValid = true;
        }
      }
    }
    return isValid;
  }

  ///Method to check if the given string only contains
  ///Numbers or decimals
  bool isNumeric({String? stringValue}) {
    if (stringValue != null && stringValue.isNotEmpty) {
      return double.tryParse(stringValue) != null;
    }
    return false;
  }

  ///To check if given String id Double type
  ///[stringToCheck] is required and can be null
  bool isDouble({String? stringToCheck}) {
    return (stringToCheck ?? "").isDouble;
  }

  ///To check if given String id Integer type
  ///[stringToCheck] is required and can be null
  bool isInt({String? stringToCheck}) {
    return (stringToCheck ?? "").isInt;
  }

  /// isNull = null.isNullOrBlank; // true
  /// isEmpty = ''.isNullOrBlank; // true
  /// isBlank = ' '.isNullOrBlank; // true
  /// isLineBreak = '\n'.isNullOrBlank; // true
  /// isFoo = ' foo '.isNullOrBlank; // false
  bool isNullOrBlank({String? givenString}) {
    return givenString.isNullOrBlank;
  }

  ///To check if given email string is valid
  ///[givenEmail] is required
  bool isValidEmail({required String givenEmail}) {
    if (isNullOrBlank(givenString: givenEmail)) {
      return false;
    }
    return EmailValidator.validate(givenEmail);
  }

  ///Get the amount string for the BE purpose without the currency symbol
  ///Without the space
  ///Only with the numbers
  String getAmountValueWithoutCurrency({required String givenAmount}) {
    String amount = "0";
    if (givenAmount.isNotEmpty) {
      if (givenAmount.contains(".")) {
        String amountLeftToDecimal = givenAmount.split(".")[0];
        String amountRightToDecimal = givenAmount.split(".")[1];

        String numericAmountLeftToDecimal = extractOnlyNumbersFromString(alphaNumericString: amountLeftToDecimal) ?? amount;
        String numericAmountRightToDecimal = extractOnlyNumbersFromString(alphaNumericString: amountRightToDecimal) ?? amount;

        amount = "$numericAmountLeftToDecimal.$numericAmountRightToDecimal";
      } else {
        amount = extractOnlyNumbersFromString(alphaNumericString: givenAmount) ?? amount;
      }
    }
    return amount;
  }

  ///extract the numbers from the string
  ///[alphaNumericString] will be like 100 98.22 Ar
  ///The return for example would be 1009822 only numbers
  ///The returned result can be null
  String? extractOnlyNumbersFromString({required String alphaNumericString}) {
    return alphaNumericString.isNotEmpty ? ((alphaNumericString).replaceAll(RegExp(r'\D'), '')) : null;
  }
}
