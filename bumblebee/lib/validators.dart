class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  static String? validateTravelStyle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Car preference is required';
    }
    return null;
  }

  static String? validateCarPreference(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Car preference is required';
    }
    return null;
  }
}
