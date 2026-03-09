import 'package:movies_project/core/resources/constants_manager.dart';

class Validations {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!RegExp(ConstantsManager.nameRegex).hasMatch(value)) {
      return "Name must contain only letters";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!RegExp(ConstantsManager.emailRegex).hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (!RegExp(ConstantsManager.phoneRegex).hasMatch(value)) {
      return "Enter a valid Egyptian phone number";
    }
    return null;
  }

  static String? validateConfirmPass(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }
}